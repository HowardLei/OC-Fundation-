//
//  ViewController.m
//  城市选择
//
//  Created by 雷维卡 on 2019/2/9.
//

#import "ViewController.h"
#import "ITProvince.h"
@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *provincePickerView;
@property (weak, nonatomic) IBOutlet UILabel *provinceLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (nonatomic, strong) NSArray<ITProvince *> *provinces;

typedef NS_ENUM(NSInteger, ITPosition) {
    ITPositionProvince,
    ITPositionCity
};
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self pickerView:self.provincePickerView didSelectRow:0 inComponent:ITPositionProvince];
    [self pickerView:self.provincePickerView didSelectRow:0 inComponent:ITPositionCity];
}
// MARK: - Picker view data source
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 2;
}
- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == ITPositionProvince) {
        return self.provinces.count;
    } else if (component == ITPositionCity) {
        NSInteger row = [pickerView selectedRowInComponent:component];
        return self.provinces[row].cities.count;
    } else {
        @throw [NSException exceptionWithName:@"picker view 选项设置失败" reason:@"没有当前枚举值" userInfo:nil];
    }
}
// MARK: - Picker view delegate
// FIXME: 显示的时候有 BUG，当换了一个省的时候，不能自动转换该省对应城市的选项
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == ITPositionProvince) {
        return self.provinces[row].name;
    } else if (component == ITPositionCity) {
        NSInteger provinceChoice = [pickerView selectedRowInComponent:ITPositionProvince];
        ITProvince *province = self.provinces[provinceChoice];
        return province.cities[row];
    } else {
        @throw [NSException exceptionWithName:@"picker view 选项设置失败" reason:@"找不到当前省份对应的名字" userInfo:nil];
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == ITPositionProvince) {
        self.provinceLabel.text = self.provinces[row].name;
    } else if (component == ITPositionCity) {
        NSInteger provinceRow = [pickerView selectedRowInComponent:ITPositionProvince];
        self.cityLabel.text = self.provinces[provinceRow].cities[row];
    } else {
        @throw [NSException exceptionWithName:@"选不到项目" reason:@"当期 picker view 没有该选项" userInfo:nil];
    }
}
// MARK: - Lazy loading model
- (NSArray<ITProvince *> *)provinces {
    if (_provinces == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"02cities" ofType:@".plist"];
        NSArray<NSDictionary *> *tempArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray<ITProvince *> *arrM = [NSMutableArray arrayWithCapacity:tempArr.count];
        for (NSDictionary *dict in tempArr) {
            ITProvince *appModel = [ITProvince provinceWithDict:dict];
            [arrM addObject:appModel];
        }
        _provinces = arrM;
    }
    return _provinces;
}
@end
