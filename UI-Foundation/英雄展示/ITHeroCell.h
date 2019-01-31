//
//  ITHeroCell.h
//  英雄展示
//
//  Created by 雷维卡 on 2019/1/30.
//

#import <UIKit/UIKit.h>
@class ITHero;
NS_ASSUME_NONNULL_BEGIN

@interface ITHeroCell : UICollectionViewCell
@property (nonatomic, strong) ITHero *model;
@end

NS_ASSUME_NONNULL_END
