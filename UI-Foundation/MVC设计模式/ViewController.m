#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *QQTextField;
@property (weak, nonatomic) IBOutlet UITextField *passcodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)Login:(UIButton *)sender {
    NSLog(@"点我干嘛");
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
