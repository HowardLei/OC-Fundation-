//
//  ITTableViewCell.m
//  好友列表
//
//  Created by jyz on 2018/11/17.
//

#import "ITTableViewCell.h"

@interface ITTableViewCell ()

@end

@implementation ITTableViewCell
- (void)setModel:(ITFriends *)model {
    _model = model;
    [self setModelDataWithModel:model];
}
// 设置模型数据
- (void)setModelDataWithModel:(ITFriends *)model {
    self.textLabel.text = model.name;
    self.textLabel.textColor = (model.isVip.boolValue == YES ? [UIColor redColor] : [UIColor blackColor]);
    self.detailTextLabel.text = model.intro;
    self.imageView.image = [UIImage imageNamed:model.icon];
}
// 设置模型的 Frame
- (void)setModelFrame {

}
// 为 tableView 创建 cell 封装一个类方法
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"friendCell";
    ITTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ITTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
@end
