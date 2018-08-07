#import "ITAppView.h"
#import "ITApp.h"
@interface ITAppView ()
@property (weak, nonatomic) IBOutlet UIImageView *appIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *appDownloadButton;

@end

@implementation ITAppView
// MARK: 重写 setModel 方法，目的是将模型里面的值自动的赋值于属性当中。
- (void)setModel:(ITApp *)model {
    _model = model;
    self.appIconImageView.image = [UIImage imageNamed:model.icon];
    self.appNameLabel.text = model.name;
}
+ (instancetype)appViewWithNib:(NSString *)nibName {
    NSBundle *bundle = [NSBundle mainBundle];
    return [[bundle loadNibNamed:nibName owner:nil options:nil] firstObject];
}
@end
