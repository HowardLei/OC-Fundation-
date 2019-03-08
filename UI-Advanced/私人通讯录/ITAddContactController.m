//
//  ITAddContactController.m
//  私人通讯录
//
//  Created by apple on 2019/3/8.
//

#import "ITAddContactController.h"

@interface ITAddContactController ()

@end

@implementation ITAddContactController

- (void)viewDidLoad {
    [super viewDidLoad];
}
/**
 点击完成按钮以后，返回原有控制器
 */
- (IBAction)done {
    // FIXME: 暂时还没有想到别的方法既保存数据又可以通过 segue 传递参数
    [self.navigationController popViewControllerAnimated:YES];
}
@end
