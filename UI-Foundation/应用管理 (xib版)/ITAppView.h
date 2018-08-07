#import <UIKit/UIKit.h>
@class ITApp;
@interface ITAppView : UIView
@property (nonatomic, strong)ITApp *model;
+ (instancetype)appViewWithNib:(NSString *)nibName;
@end
