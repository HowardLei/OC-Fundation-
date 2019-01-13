//
//  ViewController.m
//  AutoLayout四周边距注意事项
//
//  Created by apple on 2019/1/13.
//

#import "ViewController.h"
/*
 需求：创建一个 view ，保证他距离4周边界的距离都是 50
 注意：在设置的时候，一定要注意上边距与左右边界的问题。因为在默认的情况下，上边会留下一个 safe Area 的空间。在左右两边都会留下 16 points 的一点空间。如果在设置的时候不想要这段空间，则在设置的时候将 constrain to margin 这个勾勾掉即可。
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

@end
