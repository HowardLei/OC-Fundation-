//
//  ITCountryChoiceView.h
//  国旗选择
//
//  Created by 雷维卡 on 2019/2/10.
//

#import <UIKit/UIKit.h>
@class ITCountry;
NS_ASSUME_NONNULL_BEGIN

@interface ITCountryChoiceView : UIView

@property (nonatomic, strong) ITCountry *country;

#if UIKIT_DEFINE_AS_PROPERTIES
@property (nonatomic, class, readonly) ITCountryChoiceView *countryChoiceView;
@property (nonatomic, class, readonly) CGFloat rowHeight;
#else
+ (CGFloat)rowHeight;
+ (instancetype)countryChoiceView;
#endif

@end

NS_ASSUME_NONNULL_END
