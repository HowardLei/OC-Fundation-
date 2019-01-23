//
//  ITWeiboCell.m
//  微博（For AutoLayout）
//
//  Created by 雷维卡 on 2019/1/23.
//

#import "ITWeiboCell.h"
// FIXME: 还没有从 storyboard 中进行拖线
@interface ITWeiboCell ()

@end

@implementation ITWeiboCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
// FIXME: 微博模型的 set 方法还没有被重写
- (void)setWeiboModel:(ITWeibo *)weiboModel {
    _weiboModel = weiboModel;
}
@end
