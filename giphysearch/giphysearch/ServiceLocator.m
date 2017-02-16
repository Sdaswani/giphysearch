#import "ServiceLocator.h"

@implementation ServiceLocator

+ (id)sharedLocator {
    static ServiceLocator *sharedLocator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedLocator = [[self alloc] init];
    });
    return sharedLocator;
}

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

@end
