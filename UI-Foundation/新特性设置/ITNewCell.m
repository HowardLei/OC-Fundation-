//
//  ITNewCell.m
//  新特性设置
//
//  Created by 雷维卡 on 2019/2/2.
//

#import "ITNewCell.h"

@interface ITNewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation ITNewCell
- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
}
@end
