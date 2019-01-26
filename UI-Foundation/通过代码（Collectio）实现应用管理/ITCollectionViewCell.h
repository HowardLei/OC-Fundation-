//
//  ITCollectionViewCell.h
//  通过代码（Collectio）实现应用管理
//
//  Created by 雷维卡 on 2019/1/26.
//

#import <UIKit/UIKit.h>
@class ITApp;
NS_ASSUME_NONNULL_BEGIN

@interface ITCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) ITApp *model;
@end

NS_ASSUME_NONNULL_END
