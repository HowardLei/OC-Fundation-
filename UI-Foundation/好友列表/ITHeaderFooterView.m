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
        // 1、创建一个按钮
        UIButton *button = [[UIButton alloc] init];
        [button setBackgroundImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [self.contentView addSubview:button];
        self.button = button;
        // 2、创建一个标签
        UILabel *label = [[UILabel alloc] init];
        label.text = @"123";
        [self.contentView addSubview:label];
        self.label = label;
    }
    return self;
}
@end
