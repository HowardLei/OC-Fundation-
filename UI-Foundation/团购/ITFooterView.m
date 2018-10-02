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
    if ([self.delegate respondsToSelector:@selector(addElementInTableView:)]) {
        self.showMoreButton.hidden = YES;
        self.waitingView.hidden = NO;
        [self.delegate addElementInTableView:self];
    }
}
@end
