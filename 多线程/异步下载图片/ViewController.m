//
//  ViewController.m
//  异步下载图片
//
//  Created by apple on 2019/4/29.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
