//
//  ITCollectionViewCell.m
//  通过代码（Collectio）实现应用管理
//
//  Created by 雷维卡 on 2019/1/26.
//

#import "ITCollectionViewCell.h"
#import "ITApp.h"

@interface ITCollectionViewCell ()
@property (nonatomic, weak) UILabel *label;
@property (nonatomic, weak) UIImageView *imageView;
@end

@implementation ITCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setContentPropertyWithFrame:frame];
    }
    return self;
}
/**
 为自定义的 Collection view cell 设置属性
 */
- (void)setContentPropertyWithFrame:(CGRect)frame {
    // 1、设置 imageView
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(25, 20, 50, 50)];
    [self.contentView addSubview:imageView];
    self.imageView = imageView;
    // 2、设置 label
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), CGRectGetWidth(frame), 30)];
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:label];
    self.label = label;
}
- (void)setModel:(ITApp *)model {
    _model = model;
    self.label.text = model.name;
    // 设置图片开始为 0
    static NSUInteger i = 0;
    // 按照图片要求格式化出来一个新串
    NSString *imageName = [NSString stringWithFormat:@"%@%02lu", [model.icon substringToIndex:5], i];
    self.imageView.image = [UIImage imageNamed:imageName];
    i++;
}
@end
