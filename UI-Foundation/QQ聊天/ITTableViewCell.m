 //
//  ITTableViewCell.m
//  QQ聊天
//
//  Created by jyz on 2018/10/16.
//

#import "ITTableViewCell.h"

#define messageFont [UIFont systemFontOfSize:14]
#define timeFont [UIFont systemFontOfSize:12]

@interface ITTableViewCell ()
@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, weak) UIImageView *iconImageView;
@property (nonatomic, weak) UIButton *messageButton;
@end

@implementation ITTableViewCell

// 重写 initWithStyle 方法，自定义 cell 中的控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 在这个地方创建子控件
        // 1、创建一个时间控件
        UILabel *timeLabel = [[UILabel alloc] init];
        self.timeLabel = timeLabel;
        [self.contentView addSubview:timeLabel];
        // 2、创建一个头像
        UIImageView *iconImageView = [[UIImageView alloc] init];
        self.iconImageView = iconImageView;
        [self.contentView addSubview:iconImageView];
        // 3、创建一个消息框
        UIButton *messageButton = [[UIButton alloc] init];
        [messageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        messageButton.userInteractionEnabled = YES;
        self.messageButton = messageButton;
        [self.contentView addSubview:messageButton];
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
    [self.messageButton setTitle:model.text forState:UIControlStateNormal];
    self.messageButton.titleLabel.font = messageFont;
    self.messageButton.titleLabel.numberOfLines = 0;
    // 设置按钮的背景图，封装成了一个方法
    NSString *normalBubbleImage = model.type ? @"chat_recive_nor" : @"chat_send_nor";
    NSString *highLightedBubbleImage = model.type ? @"chat_recive_press_pic" : @"chat_send_press_pic";
    [self setImage:normalBubbleImage WithButton:self.messageButton ForState:UIControlStateNormal];
    [self setImage:highLightedBubbleImage WithButton:self.messageButton ForState:UIControlStateHighlighted];
    self.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
    self.messageButton.contentEdgeInsets = UIEdgeInsetsMake(15, 15, 15, 15);
}
// 设置控件的 frame
- (void)setModelFrameFromModel:(ITChat *)model {
    CGFloat margin = 5;
    CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    // 设置时间的 frame
    CGFloat timeWidth = screenWidth;
    CGFloat timeHeight = 10;
    CGFloat timeX = 0;
    CGFloat timeY = margin;
    self.timeLabel.hidden = model.timeHidden;
    if (self.timeLabel.isHidden) {
        timeHeight = 0;
    }
    self.timeLabel.frame = CGRectMake(timeX, timeY, timeWidth, timeHeight);
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.font = timeFont;
    // 设置头像的 frame
    // 注意：根据加载的头像不同，他们的头像 frame 也不完全相同
    CGFloat iconWidth = 30;
    CGFloat iconHeight = iconWidth;
    CGFloat iconX = model.type == ITChatPersonOther ? margin : screenWidth - iconWidth - margin;
    CGFloat iconY = CGRectGetMaxY(self.timeLabel.frame) + margin;
    self.iconImageView.frame = CGRectMake(iconX, iconY, iconWidth, iconHeight);
    // 设置对话框的 frame
    // 注意：根据加载的头像不同，他们的对话框的 frame 也不完全相同
    CGRect messageFrame = [self.messageButton.currentTitle boundingRectWithSize:CGSizeMake(screenWidth - 4 * iconWidth - 4 * margin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: messageFont} context:nil];
    // 注意：在这里放大 button 的 size
    CGFloat messageWidth = CGRectGetWidth(messageFrame) + 30;
    CGFloat messageHeight = CGRectGetHeight(messageFrame) + 30;
    CGFloat messageX = model.type == ITChatPersonOther ? CGRectGetMaxX(self.iconImageView.frame) : CGRectGetMinX(self.iconImageView.frame) - messageWidth;
    CGFloat messageY = iconY;
    self.messageButton.frame = CGRectMake(messageX, messageY, messageWidth, messageHeight);
    CGFloat rowHeight = MAX(CGRectGetMaxY(self.iconImageView.frame), CGRectGetMaxY(self.messageButton.frame));
    model.height = rowHeight + margin;
}
// 封装好的设置 size 方法
/*
 注意：背景图需要根据文字的大小进行变换。所以需要对已有图片进行伸缩变换。
 伸缩变换方法的总结
 1、单纯进行平铺的方法
 - (UIImage *)stretchableImageWithLeftCapWidth:(NSInteger)leftCapWidth topCapHeight:(NSInteger)topCapHeight;
 参数一：选定的点距左边距的距离。参数二：选定的点距上边框的距离。实现的效果是从图形中选定了一个点，(x, y)分别为参数一，参数二。然后根据点做与x轴y轴平行的边，截取出4个图形。保留这4个图形。剩下需要填充的部分用选定的点的色彩进行填充。
 这个方法实际上已经弃用，但是苹果 API 还没有对其进行修改。
 2、可以进行平铺和拉伸的方法
 - (UIImage *)resizableImageWithCapInsets:(UIEdgeInsets)capInsets resizingMode:(UIImageResizingMode)resizingMode （iOS 6 上的方法）
 参数一：UIEdgeInsets 需要缩放的区域。参数二：缩放的方式（拉伸: UIImageResizingModeTile， 平铺:UIImageResizingModeStretch）。实现的效果是拉伸/缩放参数一中的区域。没有缩放的地方依旧保留。

 拉伸完毕以后：还需要将按钮进行放大（注意：文字区域不放大）。因为不放大的话按钮的最大 size 是文字区域的大小。
 所以需要将按钮放大，然后在这个按钮中设置内边距(contentEdgeInsets 属性)，保证文字能够进入消息框当中。
 */
- (void)setImage:(NSString *)imageName WithButton:(UIButton *)button ForState:(UIControlState) state {
    UIImage *newImage = [UIImage imageNamed:imageName];
    const CGFloat newWidth = newImage.size.width / 2;
    const CGFloat newHeight = newImage.size.height / 2;
    newImage = [newImage resizableImageWithCapInsets:UIEdgeInsetsMake(newWidth, newHeight, newHeight, newWidth) resizingMode:UIImageResizingModeStretch];
    [button setBackgroundImage:newImage forState:state];
}
@end
