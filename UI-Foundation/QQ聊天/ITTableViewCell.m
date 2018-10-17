//
//  ITTableViewCell.m
//  QQ聊天
//
//  Created by jyz on 2018/10/16.
//
#include <stdlib.h>
#import "ITTableViewCell.h"

@interface ITTableViewCell ()
@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UIButton *messageButton;
@end

@implementation ITTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
// 重写 initWithStyle 方法，自定义 cell 中的控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 在这个地方创建子控件
        // 1、创建一个时间控件
        UILabel *timeLabel = [[UILabel alloc] init];
        self.timeLabel = timeLabel;
        [self.contentView addSubview:self.timeLabel];
        // 2、创建一个头像
        UIImageView *iconImageView = [[UIImageView alloc] init];
        self.iconImageView = iconImageView;
        [self.contentView addSubview:self.iconImageView];
        // 3、创建一个消息框
        UIButton *messageButton = [[UIButton alloc] init];
        self.messageButton = messageButton;
        [self.contentView addSubview:self.messageButton];
    }
    return self;
}
// 重写 setModel 方法。
- (void)setModel:(ITChat *)model {
    _model = model;
    [self setDataFromModel:model];
    [self setModelFrameFromModel:model];
}
// 设置控件的数据
- (void)setDataFromModel:(ITChat *)model {
    // 设置聊天的时间文本
    self.timeLabel.text = model.time;
    // 设置头像
    // 注意：由于不知道是我发的还是其他人发的，需要先根据枚举进行判断，再进行设置
    NSString *messager = model.type ? @"other" : @"me";
    self.iconImageView.image = [UIImage imageNamed:messager];
    // 设置消息按钮的文本
    self.messageButton.titleLabel.text = model.text;
    self.messageButton.titleLabel.font = [UIFont systemFontOfSize:12];
    NSString *bubbleImage = model.type ? @"chat_recive_nor" : @"chat_send_nor";
    self.messageButton.imageView.image = [UIImage imageNamed:bubbleImage];
}
// 设置控件的 frame
- (void)setModelFrameFromModel:(ITChat *)model {
    CGFloat margin = 5;
    // 设置时间的 frame
    CGFloat timeWidth = 375;
    CGFloat timeHeight = 10;
    CGFloat timeX = 0;
    CGFloat timeY = margin;
    self.timeLabel.frame = CGRectMake(timeX, timeY, timeWidth, timeHeight);
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.font = [UIFont systemFontOfSize:14];
    // 设置头像的 frame
    // 注意：根据加载的头像不同，他们的头像 frame 也不完全相同
    CGFloat iconWidth = 30;
    CGFloat iconHeight = iconWidth;
    CGFloat iconY = CGRectGetMaxY(self.timeLabel.frame) + margin;
    if (model.type) {
        CGFloat iconX = margin;
        self.iconImageView.frame = CGRectMake(iconX, iconY, iconWidth, iconHeight);
    } else {
        CGFloat iconX = self.contentView.frame.size.width - iconWidth - margin;
        self.iconImageView.frame = CGRectMake(iconX, iconY, iconWidth, iconHeight);
    }
    // 设置对话框的 frame
    // 注意：根据加载的头像不同，他们的对话框的 frame 也不完全相同
    CGSize messageSize = [model.text boundingRectWithSize:CGSizeMake(111, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12]} context:nil].size;
    CGFloat messageWidth = messageSize.width;
    CGFloat messageHeight = messageSize.height;
    CGFloat messageY = iconY;
    if (model.type) {
        CGFloat messageX = CGRectGetMaxX(self.iconImageView.frame) + margin;
        self.messageButton.frame = CGRectMake(messageX, messageY, messageWidth, messageHeight);
    } else {
        CGFloat messageX = CGRectGetMaxX(self.iconImageView.frame) + margin;
        self.messageButton.frame = CGRectMake(messageX, messageY, messageWidth, messageHeight);
    }
    CGFloat rowHeight = CGRectGetMaxY(self.messageButton.frame);
    model.height = rowHeight;
}
@end
