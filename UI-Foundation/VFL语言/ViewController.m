//
//  ViewController.m
//  VFL语言
//
//  Created by 雷维卡 on 2019/1/18.
//

#import "ViewController.h"
/*
 Auto Layout 的布局方式之 VFL 布局
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self show];
}
- (void)show {
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    UIView *purpleView = [[UIView alloc] init];
    purpleView.backgroundColor = [UIColor purpleColor];
    purpleView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:purpleView];
    
    CGFloat margin = 35;
    NSString *redFormat = [NSString stringWithFormat:@"H:|-%g-[redView]-%g-|", margin, margin];
    NSArray<NSLayoutConstraint*> *redHorizontal = [NSLayoutConstraint constraintsWithVisualFormat:redFormat options:NSLayoutFormatAlignAllTop metrics:nil views:@{@"redView": redView}];
    [self.view addConstraints:redHorizontal];
    
    NSString *purpleFormat = [NSString stringWithFormat:@"V:|-%g-[redView(50)]-%g-[purpleView(==redView)]", margin, margin];
    NSDictionary *purpleViews = NSDictionaryOfVariableBindings(redView, purpleView);
    NSArray<NSLayoutConstraint *> *purpleVertical = [NSLayoutConstraint constraintsWithVisualFormat:purpleFormat options:NSLayoutFormatAlignAllLeft metrics:nil views:purpleViews];
    [self.view addConstraints:purpleVertical];
    // FIXME: 紫色的 view 怎么都出不来
}
@end
