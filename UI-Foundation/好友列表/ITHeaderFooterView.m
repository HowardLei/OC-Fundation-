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
    self.label.text = [NSString stringWithFormat:@"%d / %lu", model.online.intValue, model.friends.count];
}
- (void)setDataFrameWithModel:(ITGroup *)model {
    self.button.frame = CGRectMake(0, 0, 100, 40);
    self.label.frame = CGRectMake(250, 0, 55, 40);
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
