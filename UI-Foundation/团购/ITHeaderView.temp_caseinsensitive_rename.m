#import "ITHeaderView.h"

@interface ITHeaderView ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ITHeaderView
- (void)awakeFromNib {
    [super awakeFromNib];

}
+ (instancetype)headerViewFromNib:(NSString *)nib {
    ITHeaderVIew *headerView = [[[NSBundle mainBundle] loadNibNamed:nib owner:nil options:nil] firstObject];
    return headerView;
}
@end
