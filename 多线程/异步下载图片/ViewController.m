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

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)showImage:(UIButton *)sender {
    // 创建子线程，执行下载动作
    [NSThread detachNewThreadSelector:@selector(downloadImage) toTarget:self withObject:nil];
}
- (void)downloadImage {
    NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1556552942866&di=24c024e198e7cb243247413e19fb50a8&imgtype=jpg&src=http%3A%2F%2Fupload.ikanchai.com%2F2016%2F0704%2F1467601486394.jpg"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    // 当图片下载完成以后，才在主线程上执行刷新动作
    [self performSelectorOnMainThread:@selector(setImageInImageView:) withObject:image waitUntilDone:YES];
}
- (void)setImageInImageView:(UIImage *)image {
    self.imageView.image = image;
}
- (void)setImage {
}
@end
