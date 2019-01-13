//
//  ViewController.m
//  AutoLayout的加强使用方法
//
//  Created by apple on 2019/1/13.
//

#import "ViewController.h"
/*
 需求：在控制器中添加 2 个 view, 1 个蓝色，1 个红色
    1、2 个 view 高度永远相同，高度为 50
    2、红色 view 和蓝色 view 右边对齐
    3、蓝色 view 距父控件左边、右边、上边间距相同。均为30
    4、蓝色 view 距离红色 view 间距固定。均为 30
    5、红色 view 的左边和父控件的中点对齐。（红色的 view 是蓝色的 view 的一半）
 设置思路：
    1、创建蓝色 view ，设置高度为 50，距左边、右边、上边间距为 30 。
    2、创建红色 view ，设置高度与宽度与蓝色 view 一致，上间距为 30。右边的间距为 30
    3、选择设置红色 view 宽度的那一个 constraints 。点击右边栏中的 size inspectors 。选择 multiplier 倍数，选择 0.5 即可。
 */
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *redView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
