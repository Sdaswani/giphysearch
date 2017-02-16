#import "Request.h"

@implementation Request

-(id) initWithSearchTerm:(NSString*)term {
    self = [super init];
    if (self) {
        _searchTerm = term;
    }
    return self;
}

@end
