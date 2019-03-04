//
//  ITRedViewController.m
//  通过StoryBoard创建导航控制器
//
//  Created by apple on 2019/3/3.
//

#import "ITRedViewController.h"
#import "ITBlueViewController.h"
@interface ITRedViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *go2BlueButton;

@end

@implementation ITRedViewController
/**
 当你需要解决 segue 传值的时候，调用这个方法进行传值操作
 @param segue 需要进行交互的路径
 @param sender 触发这个方法的控件
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ITBlueViewController *blueVC = segue.destinationViewController;
    blueVC.navigationItem.title = self.textField.text;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
@end
