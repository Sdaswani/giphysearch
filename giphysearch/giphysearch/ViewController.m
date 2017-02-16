#include <stdlib.h>
#import "ViewController.h"
#import "CollectionViewCell.h"
#import <Giphy-iOS/AXCGiphy.h>
#import <AnimatedGIFImageSerialization/AnimatedGIFImageSerialization.h>
#import "Request.h"
#import "ServiceLocator.h"

NSString * const CollectionViewCellIdentifier = @"CellReuseIdentifier";
@interface ViewController () <UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSArray* searchResults;
@property (weak, nonatomic) IBOutlet UICollectionView* collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout* collectionViewFlowLayout;
@property (nonatomic, weak) IBOutlet UISearchBar* searchBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.collectionView.collectionViewLayout = self.collectionViewFlowLayout;

    [self customizeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UI customizations
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

-(void)customizeView {
    [self setNeedsStatusBarAppearanceUpdate];
    
    // UISearchBar Color Customizations - BEGIN
    self.searchBar.backgroundImage = [[UIImage alloc] init];
    self.searchBar.backgroundColor = [UIColor darkGrayColor];
    // TODO: Fix this terrible hack https://github.com/Sdaswani/giphysearch/issues/1
    self.searchBar.placeholder = @"Search Giphy                                                                    ";
    
    // Magnifying glass icon needs to change color and be repositioned
    UITextField *searchBarTextField = [self.searchBar valueForKey:@"_searchField"];
    //[searchBarTextField setLeftViewMode:UITextFieldViewModeNever];
    [searchBarTextField setRightViewMode:UITextFieldViewModeNever];
    UIImageView *leftImageView = (UIImageView *)searchBarTextField.leftView;
    leftImageView.image = [leftImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    leftImageView.tintColor = [UIColor greenColor];
    // UISearchBar Color Customizations - END
}

#pragma mark ResultProcessor methods
-(void) processResults:(NSArray*)results {
    // TODO: do something smart if results count is zero.
    self.searchResults = results;
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.collectionView reloadData];
    }];
}

#pragma mark UISearchBarDelegate methods
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    Request* newRequest = [[Request alloc] initWithSearchTerm:searchBar.text];
    [[[ServiceLocator sharedLocator] requestProcessor] processRequest:newRequest];
}

#pragma mark UICollectionViewDataSource
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.searchResults.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellIdentifier forIndexPath:indexPath];
    AXCGiphy* gif = self.searchResults[indexPath.item];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:gif.originalImage.url];
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        UIImage * image = [UIImage imageWithData:data];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            cell.imageView.image = image;
        }];
    }] resume];
    
    return cell;
}

#pragma UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    int collectionViewSizeWidth = collectionView.frame.size.width - arc4random_uniform(50) - 5;
    int collectionViewSizeHeight = collectionView.frame.size.width - arc4random_uniform(25) - 5;
    return CGSizeMake(collectionViewSizeWidth/2, collectionViewSizeHeight/2);
}

@end
