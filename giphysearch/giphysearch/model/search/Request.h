#import <Foundation/Foundation.h>

@interface Request : NSObject

-(id) initWithSearchTerm:(NSString*)term;
@property (readonly) NSString* searchTerm;

@end
