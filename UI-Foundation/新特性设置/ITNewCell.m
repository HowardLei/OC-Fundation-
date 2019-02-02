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
// FIXME: label 当中的值还没有设置完成。
- (void)setPath:(NSIndexPath *)path {
    _path = path;
    self.contentLabel.text = [NSString stringWithFormat:@"%ld/%ld", path.section, path.row];
}
@end
