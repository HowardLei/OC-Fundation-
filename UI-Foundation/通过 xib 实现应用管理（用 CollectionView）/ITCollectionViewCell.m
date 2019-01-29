//
//  ITCollectionViewCell.m
//  通过 xib 实现应用管理（用 CollectionView）
//
//  Created by 雷维卡 on 2019/1/27.
//

#import "ITCollectionViewCell.h"

@interface ITCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@end

@implementation ITCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setModel:(ITModel *)model {
    _model = model;
    self.nameLabel.text = model.name;
    self.imageView.image = [UIImage imageNamed:model.icon];
}
@end
