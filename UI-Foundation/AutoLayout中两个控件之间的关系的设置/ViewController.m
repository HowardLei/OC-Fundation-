//
//  ViewController.m
//  AutoLayout中两个控件之间的关系的设置
//
//  Created by apple on 2019/1/13.
//

#import "ViewController.h"
/*
 需求：创建 2 个 view。要求：
    距离左右 20，两个 view 之间的距离始终是 20，两个 view 的高度为 50，宽度相同。
 注意：在这个设置当中，可以有不同的设置方式。其中 1 个思路如下：
    1、创建一个 view ，设置其左边距、下边距和高度
    2、再创建第二个 view，设置其右边距与下边距
    3、选择好这两个 view，然后选择高度、宽度相同
    4、选择左边的 view ，设置他的右边距（注意：设置的时候选择第二个 view）。
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
