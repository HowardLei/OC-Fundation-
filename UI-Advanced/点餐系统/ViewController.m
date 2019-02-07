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
@property (nonatomic, strong) NSArray<NSArray<NSString *> *> *models;
@end

@implementation ViewController
// MARK: - Lazy loading model
- (NSArray<NSArray<NSString *> *> *)models {
    if (_models == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"01foods" ofType:@".plist"];
        _models = [NSArray arrayWithContentsOfFile:path];
    }
    return _models;
}
- (void)viewDidLoad {
    [super viewDidLoad];
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
 @param pickerView <#pickerView description#>
 @param row <#row description#>
 @param component <#component description#>
 */
// TODO: 将数据转化到 label 当中
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // 1、获取数据
    NSArray<NSString *> *item = self.models[component];
    // 2、设置 label 当中的值
}
@end
