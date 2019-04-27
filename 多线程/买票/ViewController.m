//
//  ViewController.m
//  买票
//
//  Created by apple on 2019/4/27.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *safeButton;
@property (weak, nonatomic) IBOutlet UIButton *unsafeButton;
@property (nonatomic, strong) NSThread *beijingStation;
@property (nonatomic, strong) NSThread *shanghaiStation;
@property (nonatomic, assign) NSUInteger leftTickets;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
// MARK: - 线程安全的购买车票
- (IBAction)safeBuyTicketButton:(UIButton *)sender {
    self.leftTickets = 50;
    self.beijingStation = [[NSThread alloc] initWithTarget:self selector:@selector(safeBuyTicket) object:nil];
    self.shanghaiStation = [[NSThread alloc] initWithTarget:self selector:@selector(safeBuyTicket) object:nil];
    [self.beijingStation start];
    [self.shanghaiStation start];
}
-  (void)safeBuyTicket {
    
}
// MARK: - 线程不安全的购买车票
- (IBAction)unsafeBuyTicketButton:(UIButton *)sender {
    
}
@end
