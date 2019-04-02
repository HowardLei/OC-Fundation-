//
//  ViewController.m
//  模拟圆下载进度条
//
//  Created by 雷维卡 on 2019/4/1.
//

#import "ViewController.h"
#import "ITView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet ITView *downloadView;
@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 600, 100, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    self.label = label;
    [self.view addSubview:label];
}
- (IBAction)sliderChange:(UISlider *)sender {
    float value = sender.value;
    self.label.text = [NSString stringWithFormat:@"%.2f%%", value * 100];
    self.downloadView.progress = value;
}
@end
