#import <UIKit/UIKit.h>
/*
 为什么不将控件直接连接在 UIView 当中，还要单独创造一个类继承这个类？
 因为 UIView 是系统定义的类，不能再创造新的属性。所以必须自己创造一个新的类继承自 UIView ，而且让所对应的控件所属的类变为自定义的类。
 */
@class ITApp;
@interface ITAppView : UIView
@property (nonatomic, strong)ITApp *model;
+ (instancetype)appViewWithNib:(NSString *)nibName;
@end
