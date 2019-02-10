//
//  ITCountryChoiceView.m
//  国旗选择
//
//  Created by 雷维卡 on 2019/2/10.
//

#import "ITCountryChoiceView.h"
#import "ITCountry.h"

@interface ITCountryChoiceView ()

@property (weak, nonatomic) IBOutlet UILabel *countryNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *countryImageView;

@end

@implementation ITCountryChoiceView
/**
 创建 ITCountryChoiceView 的时候，在 ITCountryChoiceView 类当中封装一个方法，降低控制器中的耦合。
 @return 创建好的 ITCountryChoiceView
 */
+ (instancetype)countryChoiceView {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([ITCountryChoiceView class]) owner:nil options:nil].firstObject;
}
/**
 类方法获得创建 view 的行高
 @return 当前 view 的行高
 */
+ (CGFloat)rowHeight {
    return CGRectGetHeight([[self countryChoiceView] frame]);
}
/**
 将导入好的国家数据设置到控件当中
 @param country 国家数据
 */
- (void)setCountry:(ITCountry *)country {
    _country = country;
    self.countryNameLabel.text = country.name;
    self.countryImageView.image = [UIImage imageNamed:country.icon];
}
@end
