#import "RequestProcessor.h"
#import <Giphy-iOS/AXCGiphy.h>
#import "ServiceLocator.h"

NSInteger const MaximumResults = 1000;
@implementation RequestProcessor

-(id) init {
    self = [super init];
    if (self) {
        [AXCGiphy setGiphyAPIKey:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"GiphyAPIKey"]];
    }
    return self;
}

-(void) processRequest:(Request*)request {
    [AXCGiphy searchGiphyWithTerm:[request searchTerm] limit:MaximumResults
                           offset:0 completion:^(NSArray *results, NSError *error) {
                               if (!error) {
                                   [[[ServiceLocator sharedLocator] resultProcessor] processResults:results];
                               }
                           }];
}

@end
