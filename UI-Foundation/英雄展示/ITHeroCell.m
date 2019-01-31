//
//  ITHeroCell.m
//  英雄展示
//
//  Created by 雷维卡 on 2019/1/30.
//

#import "ITHeroCell.h"
#import "ITHero.h"

@interface ITHeroCell ()
@property (weak, nonatomic) IBOutlet UIImageView *heroImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation ITHeroCell
- (void)setModel:(ITHero *)model {
    _model = model;
    self.nameLabel.text = model.name;
    self.heroImageView.image = [UIImage imageNamed:model.icon];
    self.contentLabel.text = model.intro;
}
@end
