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
// 创建一个属性，将选中的省份数据保存起来。目的：解决数组越界的 BUG。
@property (nonatomic, strong) ITProvince *chooseProvince;

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
        NSInteger provinceRow = [pickerView selectedRowInComponent:ITPositionProvince];
        ITProvince *province = self.provinces[provinceRow];
        self.chooseProvince = province;
        return self.chooseProvince.cities.count;
    } else {
        @throw [NSException exceptionWithName:@"picker view 选项设置失败" reason:@"没有当前枚举值" userInfo:nil];
    }
}
// MARK: - Picker view delegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == ITPositionProvince) {
        return self.provinces[row].name;
    } else if (component == ITPositionCity) {
        return self.chooseProvince.cities[row];
    } else {
        @throw [NSException exceptionWithName:@"picker view 选项设置失败" reason:@"找不到当前省份对应的名字" userInfo:nil];
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // 当选择省份那部分选项的时候，执行下面的方法
    if (component == ITPositionProvince) {
        // 注意：由于选项是根据省的组成部分决定的，每个省与每个省之间的城市又不一样，所以说在更换省份选项的时候要刷新城市的选项。
        [pickerView reloadComponent:ITPositionCity];
        [pickerView selectRow:0 inComponent:ITPositionCity animated:YES];
        self.provinceLabel.text = self.provinces[row].name;
        // 注意：这个地方由于已经选择了省份了，所以需要将城市当中的选项改为第 0 项。以保证城市的 label 显示正确。
        row = 0;
    }
    // 当选择的市的时候，省名保留即可
    NSInteger provinceRow = [pickerView selectedRowInComponent:ITPositionProvince];
    self.cityLabel.text = self.provinces[provinceRow].cities[row];
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
