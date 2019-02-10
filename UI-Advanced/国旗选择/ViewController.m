//
//  ViewController.m
//  国旗选择
//
//  Created by 雷维卡 on 2019/2/10.
//

#import "ViewController.h"
#import "ITCountry.h"
#import "ITCountryChoiceView.h"
@interface ViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *countryPickerView;
@property (nonatomic, strong) NSArray<ITCountry *> *countries;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
// MARK: - Picker view data source
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.countries.count;
}
// MARK: - Picker view delegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.countries[row].name;
}
// 当 UIPickerView 选项的界面满足不了你的需求的时候，需要重写这个方法
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    ITCountryChoiceView *countryView = ITCountryChoiceView.countryChoiceView;
    countryView.country = self.countries[row];
    return countryView;
}
// 注意：当 picker view 的行高需要改变的时候，就要重写此方法
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return ITCountryChoiceView.rowHeight;
}
// MARK: - Lazy loading data
- (NSArray<ITCountry *> *)countries {
    if (_countries == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"03flags" ofType:@".plist"];
        NSArray<NSDictionary *> *tempArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray<ITCountry *> *arrM = [NSMutableArray arrayWithCapacity:tempArr.count];
        for (NSDictionary *dict in tempArr) {
            ITCountry *appModel = [ITCountry countryWithDict:dict];
            [arrM addObject:appModel];
        }
        _countries = [arrM copy];
    }
    return _countries;
}

@end
