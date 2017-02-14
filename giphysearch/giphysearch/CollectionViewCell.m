#import "CollectionViewCell.h"

@implementation  CollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void) prepareForReuse
{
    [super prepareForReuse];
    self.imageView.image = nil;
}

@end
