//
//  ITCollectionViewCell.h
//  通过 xib 实现应用管理（用 CollectionView）
//
//  Created by 雷维卡 on 2019/1/27.
//

#import <UIKit/UIKit.h>
#import "ITModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ITCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) ITModel *model;
@end

NS_ASSUME_NONNULL_END
