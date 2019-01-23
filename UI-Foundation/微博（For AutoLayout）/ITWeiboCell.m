//
//  ITWeiboCell.m
//  微博（For AutoLayout）
//
//  Created by 雷维卡 on 2019/1/23.
//

#import "ITWeiboCell.h"

@interface ITWeiboCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *vipImageView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;

@end

@implementation ITWeiboCell

/**
 将模型中的数据添加到单元格当中
 @param weiboModel 需要添加的模型
 */
- (void)setWeiboModel:(ITWeibo *)weiboModel {
    _weiboModel = weiboModel;
    self.iconImageView.image = [UIImage imageNamed:weiboModel.icon];
    self.nameLabel.text = weiboModel.name;
    self.vipImageView.image = [UIImage imageNamed:@"vip"];
    self.vipImageView.hidden = !weiboModel.isVip;
    self.contentLabel.text = weiboModel.text;
    self.pictureImageView.image = [UIImage imageNamed:weiboModel.picture];
}

@end
