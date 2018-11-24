//
//  ITHeaderFooterView.m
//  好友列表
//
//  Created by jyz on 2018/11/21.
//

#import "ITHeaderFooterView.h"

@interface ITHeaderFooterView ()
@property (nonatomic, weak) UIButton *button;
@property (nonatomic, weak) UILabel *label;
@end

@implementation ITHeaderFooterView
// 注意：在设置模型的方法当中，并没有对模型中的 frame 进行设置
- (void)setModel:(ITGroup *)model {
    _model = model;
    [self setDataWithModel:model];
}
- (void)setDataWithModel:(ITGroup *)model {
    [self.button setTitle:model.name forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.button.imageView.contentMode = UIViewContentModeCenter;
    self.button.imageView.clipsToBounds = NO;
    /*
     注意：在设置按钮的图片的时候，需要检查一下小三角是不是应该旋转。因为当他不检查的时候，会由于 headerView 的复用而将之前展开的三角形保留下来。
     */
    [self triangleRotate];
    [self.button addTarget:self action:@selector(touchToFoldOrUnfold) forControlEvents:UIControlEventTouchUpInside];
    self.label.text = [NSString stringWithFormat:@"%d / %lu", model.online.intValue, model.friends.count];
}
// 注意：在这个方法无法通过 self.bounds 属性设置 frame。因为这个时候的 bounds 还是 {0, 0}, {0, 0}
/*
 原因：
    在创建 headerView 的过程当中，并没有对 headerView 的 frame 属性进行赋值，直到程序运行的时候，当加载到 UITableView 的 headerView 的时候，UITableView 内部就会动态对 headerView.frame 进行赋值。也就是说，当 UITableView 即将使用到 headerView 的时候，才会对 headerView.frame 进行赋值。(这里面如果赋死值依然有意义)
    也就是说，只有当 headerView 的 frame 被赋值了以后，他的 bounds 值才有意义。
 */
- (void)setDataFrameWithModel:(ITGroup *)model {
}
// MARK: 按钮的点击事件
- (void)touchToFoldOrUnfold {
    // 1、设置群组是否为可见
    self.model.visible = !self.model.isVisible;
    // 2、执行代理方法
    if ([self.delegate respondsToSelector:@selector(reloadTheDataWithHeaderView:)]) {
        [self.delegate reloadTheDataWithHeaderView:self];
    }
    /*
     本来这个地方是要设置旋转，为啥不能在这设置，由于旋转的时候会有一段时间的动画，而代理方法执行速度比动画快，会导致动画还没播完而单元格已经重新经过刷新。等动画播完以后 tableView 已经刷新完成了，而刷新完的 tableView 的上边的小三角在初始化的时候是指向右。所以会出现先执行完旋转而后又恢复原状。
     解决方法：等他刷新完 tableView 以后再执行旋转。调用 didMoveToSuperview 方法
     */
}
// MARK: 当 headerView 的父控件(也就是 tableView)发生改变的时候需要执行的方法
- (void)didMoveToSuperview {
    // 3、旋转小三角
    [self triangleRotate];
}
// MARK: 判断小三角是否旋转
- (void)triangleRotate {
    if (self.model.isVisible) {
        [UIView animateWithDuration:0.5 animations:^{
            self.button.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            self.button.imageView.transform = CGAffineTransformMakeRotation(0);
        }];
    }
}
// 设置子控件布局的方法。
// 该方法触发条件：1、改变了 view 的 frame 。2、调用 addSubView 方法的时候。
// 注意：一旦重写该方法，必须保证父类先调用该方法
- (void)layoutSubviews {
    [super layoutSubviews];
    // 设置 button 的 frame
    self.button.frame = self.bounds;
    self.button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    self.button.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    // FIXME:设置 label 的 frame
    self.label.frame = CGRectMake(300, 0, 100, self.bounds.size.height);
}
+ (instancetype)headerFooterViewWithTableView:(UITableView *)tableView {
    static NSString *ID = @"headerFooterView";
    ITHeaderFooterView *headerFooterView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (!headerFooterView) {
        headerFooterView = [[ITHeaderFooterView alloc] initWithReuseIdentifier:ID];
    }
    return headerFooterView;
}
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        // 1、创建一个 button
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [self.contentView addSubview:button];
        self.button = button;
        // 2、创建一个 label
        UILabel *label = [[UILabel alloc] init];
        [self.contentView addSubview:label];
        self.label = label;
    }
    return self;
}
@end
