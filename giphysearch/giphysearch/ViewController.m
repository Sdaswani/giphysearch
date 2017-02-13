//
//  ViewController.m
//  giphysearch
//
//  Created by Anita Daswani on 2/12/17.
//  Copyright © 2017 SMD. All rights reserved.
//

#import "ViewController.h"
#import <Giphy-iOS/AXCGiphy.h>

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UISearchBar* searchBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [AXCGiphy setGiphyAPIKey:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"GiphyAPIKey"]];
    self.searchBar.placeholder = @"Search Giphy";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UISearchBarDelegate methods
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [AXCGiphy searchGiphyWithTerm:searchBar.text limit:10
                           offset:0 completion:^(NSArray *results, NSError *error) {
    }];
}

@end
