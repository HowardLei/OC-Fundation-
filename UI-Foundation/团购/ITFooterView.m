#import "ITFooterView.h"

@interface ITFooterView ()

@property (weak, nonatomic) IBOutlet UIButton *showMoreButton;
@property (weak, nonatomic) IBOutlet UIView *waitingView;
- (IBAction)showMore:(UIButton *)sender;
@end

@implementation ITFooterView
/**
 点击按钮展示更多数据
 @param sender 点击的按钮
 */
- (IBAction)showMore:(UIButton *)sender {
    self.showMoreButton.hidden = YES;
    self.waitingView.hidden = NO;
    // 注意：后边的代码需要延迟 1s 后执行，所以需要使用 GCD 延迟执行。
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 判断代理是否实现了代理的方法，如果没实现编译器就会出现警告
        if ([self.delegate respondsToSelector:@selector(addElementInTableView:)]) {
            [self.delegate addElementInTableView:self];
        }
        self.showMoreButton.hidden = NO;
        self.waitingView.hidden = YES;
    });
}
+ (instancetype)footerViewFromNib:(NSString *)nib {
    ITFooterView *view = [[[NSBundle mainBundle] loadNibNamed:nib owner:nil options:nil] firstObject];
    return view;
}
@end
