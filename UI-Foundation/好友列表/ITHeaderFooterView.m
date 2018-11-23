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
- (void)setModel:(ITGroup *)model {
    _model = model;
    [self setDataWithModel:model];
    [self setDataFrameWithModel:model];
}
- (void)setDataWithModel:(ITGroup *)model {
    [self.button setTitle:model.name forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.button.backgroundColor = [UIColor yellowColor];
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

    CGSize labelSize = [self.label.text boundingRectWithSize:CGSizeMake(MAXFLOAT, self.bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12]} context:nil].size;
    self.label.frame = CGRectMake(300, 0, 100, 100);
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
