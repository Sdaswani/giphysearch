#import "ViewController.h"
#import <Giphy-iOS/AXCGiphy.h>

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UISearchBar* searchBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [AXCGiphy setGiphyAPIKey:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"GiphyAPIKey"]];
    [self setNeedsStatusBarAppearanceUpdate];
    
    // UISearchBar Color Customizations - BEGIN
    self.searchBar.backgroundImage = [[UIImage alloc] init];
    self.searchBar.backgroundColor = [UIColor darkGrayColor];
    // TODO: Fix this terrible hack
    self.searchBar.placeholder = @"Search Giphy                                                                                                                        ";
    
    // Magnifying glass icon needs to change color and be repositioned
    UITextField *searchBarTextField = [self.searchBar valueForKey:@"_searchField"];
    //[searchBarTextField setLeftViewMode:UITextFieldViewModeNever];
    [searchBarTextField setRightViewMode:UITextFieldViewModeNever];
    UIImageView *leftImageView = (UIImageView *)searchBarTextField.leftView;
    leftImageView.image = [leftImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    leftImageView.tintColor = [UIColor greenColor];
    // UISearchBar Color Customizations - END
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UI customizations
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark UISearchBarDelegate methods
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [AXCGiphy searchGiphyWithTerm:searchBar.text limit:10
                           offset:0 completion:^(NSArray *results, NSError *error) {
    }];
}

@end
