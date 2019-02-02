//
//  ITPhotoCell.m
//  自定义布局
//
//  Created by 雷维卡 on 2019/2/2.
//

#import "ITPhotoCell.h"

@interface ITPhotoCell ()

@end

@implementation ITPhotoCell
- (instancetype)initWithFrame:(CGRect)frame  {
    if (self = [super initWithFrame:frame]) {
        // 向 cell 当中添加 imageView
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        imageView.image = [UIImage imageNamed:@"Image0"];
        [self.contentView addSubview:imageView];
    }
    return self;
}
@end
