//
//  ViewController.m
//  点餐系统
//
//  Created by 雷维卡 on 2019/2/7.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *menuView;
@property (weak, nonatomic) IBOutlet UIView *showView;
@property (weak, nonatomic) IBOutlet UILabel *fruitChoiceLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainCourseChoiceLabel;
@property (weak, nonatomic) IBOutlet UILabel *drinkChoiceLabel;
@property (weak, nonatomic) IBOutlet UIButton *randomChooseButton;
@property (nonatomic, strong) NSArray<NSArray<NSString *> *> *models;

- (IBAction)randomChoose;

typedef NS_ENUM(NSUInteger, ITChoice) {
    ITChoiceFruit,
    ITChoiceMainCourse,
    ITChoiceDrink,
};
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (NSUInteger i = 0; i < self.models.count; i++) {
        [self pickerView:self.menuView didSelectRow:0 inComponent:i];
    }
}
// MARK: - Picker view data source
/**
 设置当前 Picker view 有几个组成部分
 @param pickerView 绑定好的 picker view
 @return 组成 picker view 的数量
 */
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return self.models.count;
}
/**
 每个组成部分有几个选项
 @param pickerView 绑定好的 picker view
 @param component 第几组的选项
 @return 每个组成部分的选项数
 */
- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    // 1、获得每个组成部分的数组
    NSArray<NSString *> *items = self.models[component];
    return items.count;
}
// MARK: - Picker view delegate
/**
 设置每个选项的数据
 @param pickerView 绑定在当前控制器的 Picker view
 @param row 哪一行
 @param component 哪一个组成部分
 @return 每个选项需要显示的内容
 */
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSArray<NSString *> *items = self.models[component];
    NSString *detail = items[row];
    return detail;
}
/**
 当 picker view 当中的选项被选中的时候，触发当前方法
 @param pickerView 绑定的 picker view
 @param row 选定的行
 @param component 选定的组成部分
 */
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // 1、获取数据
    NSArray<NSString *> *item = self.models[component];
    // 2、设置 label 当中的值。为了方便判断这里选择使用枚举。
    switch (component) {
        case ITChoiceFruit:
            self.fruitChoiceLabel.text = item[row];
            break;
        case ITChoiceMainCourse:
            self.mainCourseChoiceLabel.text = item[row];
            break;
        case ITChoiceDrink:
            self.drinkChoiceLabel.text = item[row];
            break;
    }
}
// MARK: - Lazy loading model
- (NSArray<NSArray<NSString *> *> *)models {
    if (_models == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"01foods" ofType:@".plist"];
        _models = [NSArray arrayWithContentsOfFile:path];
    }
    return _models;
}
// MARK: - 按钮点击事件
/**
 当点击随机点餐的时候，实现下面的方法
 */
- (IBAction)randomChoose {
    for (NSInteger i = 0; i < self.models.count; i++) {
        // 1、调整 picker view 当中选定的按钮
        // 计算随机的行，注意每个部分之间的行不相同。
        NSUInteger row = arc4random_uniform((unsigned int)self.models[i].count);
        // 注意：为了防止出现随机点餐出现选项相同，进行一个 while 循环判断。如果相同，则行标继续重新生成，直到不同为止。
        while (row == [self.menuView selectedRowInComponent:i]) {
            row = arc4random_uniform((unsigned int)self.models[i].count);
        }
        [self.menuView selectRow:row inComponent:i animated:YES];
        // 2、调整 label 里面的内容。使其与上边选择好的进行一一对应
        [self pickerView:self.menuView didSelectRow:row inComponent:i];
    }
}
@end
