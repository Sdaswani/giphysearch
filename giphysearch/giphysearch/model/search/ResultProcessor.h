#import <Foundation/Foundation.h>

@protocol ResultProcessor <NSObject>

/** The NSArray will be filled with items of type AXCGiphy*.
 * See <Giphy-iOS/AXCGiphy.h> for more details.
 */
-(void) processResults:(NSArray*)results;

@end
