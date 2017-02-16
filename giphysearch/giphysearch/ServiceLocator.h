#import <Foundation/Foundation.h>
#import "RequestProcessor.h"
#import "ResultProcessor.h"

@interface ServiceLocator : NSObject

+(id) sharedLocator;
@property RequestProcessor* requestProcessor;
@property id<ResultProcessor> resultProcessor;
@end
