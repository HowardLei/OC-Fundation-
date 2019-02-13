//
//  ViewController.m
//  UIDatePicker 基础操作
//
//  Created by 雷维卡 on 2019/2/10.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UIToolbar *toolbar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dateTextField.inputView = self.datePicker;
    self.dateTextField.inputAccessoryView = self.toolbar;
}
// MARK: - Lazy loading widget
- (UIToolbar *)toolbar {
    if (_toolbar == nil) {
        _toolbar = [[UIToolbar alloc] init];
        // 注意：在设置 toolbar 的时候，必须指定 toolbar 的 frame 才行
        // toolbar 的宽度设置为 0 即为屏幕的宽度
        _toolbar.frame = CGRectMake(0, 0, 0, 44);
        // 向 toolbar 添加按钮
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:nil];
        UIBarButtonItem *bounceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:nil];
        _toolbar.items = @[cancelItem, bounceItem, doneItem];
    }
    return _toolbar;
}
- (UIDatePicker *)datePicker {
    if (_datePicker == nil) {
        _datePicker = [[UIDatePicker alloc] init];
        // 设置该日期控件的本地化语言
        _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-hans"];
        _datePicker.datePickerMode = UIDatePickerModeDate;
    }
    return _datePicker;
}
@end
