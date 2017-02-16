#import <Foundation/Foundation.h>
#import "Request.h"

@interface RequestProcessor : NSObject

-(id) init;
-(void) processRequest:(Request*)request;

@end
