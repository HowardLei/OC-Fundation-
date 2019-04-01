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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] init];
    label.center = self.view.center;
}
- (IBAction)sliderChange:(UISlider *)sender {
    self.downloadView.progress = sender.value;
}
@end
