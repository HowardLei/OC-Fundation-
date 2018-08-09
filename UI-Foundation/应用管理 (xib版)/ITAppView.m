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
// MARK: 点击以后出现正在下载按钮的动画，播放完消失
- (IBAction)download:(UIButton *)sender {
    // 1、创建一个 UILabel 对象
    UILabel *downloadingLabel = [[UILabel alloc] init];
    // 2、对这个 downloadingLabel 属性进行赋值
    // 2.1 调整 label 的透明度——属性为 alpha
    downloadingLabel.alpha = 0;
    // 2.2 调整 label 的背景颜色
    downloadingLabel.backgroundColor = [UIColor grayColor];
    // 2.3 调整 label 的位置及大小
    downloadingLabel.frame = CGRectMake(57, 353, 300, 30);
    // 2.4 调整 label 里面显示的文本及字体颜色和对齐方式
    downloadingLabel.text = @"正在下载";
    downloadingLabel.textColor = [UIColor blueColor];
    downloadingLabel.textAlignment = NSTextAlignmentCenter;
    // 2.5 调整 label 的圆角曲率。属性 layer.cornerRadius
    downloadingLabel.layer.cornerRadius = 5;
    // 2.6 去除多余圆角的区域。默认为 NO。
    downloadingLabel.layer.masksToBounds = YES;
    [self.superview addSubview:downloadingLabel];
    // 3、为这个 label 添加动画，注意：这个动画需要在结束后进行判断，判断动画是否进行完毕，进行完毕以后才能进行消失动画。如果消失动画也进行完毕了，则将这个 downloadALabel 从 View 中清除。
    [UIView animateWithDuration:1.3 animations:^{
        downloadingLabel.alpha = 0.6;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:1.3 delay:1 options:UIViewAnimationOptionCurveLinear animations:^{
                downloadingLabel.alpha = 0;
            } completion:^(BOOL finished) {
                if(finished) {
                    [downloadingLabel removeFromSuperview];
                }
            }];
        }
    }];
}
@end
