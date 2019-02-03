//
//  ITPhotoFlowLayout.h
//  自定义布局
//
//  Created by 雷维卡 on 2019/2/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/*
 当你需要实现的效果用 UICollectionViewFlowLayout 类满足不了需求的时候。就需要自己自定义类继承自 UICollectionLayout（定制度高） 或者是 UICollectionFlowLayout（实现了一些基本功能） 。
 */
@interface ITPhotoFlowLayout : UICollectionViewFlowLayout

@end

NS_ASSUME_NONNULL_END
