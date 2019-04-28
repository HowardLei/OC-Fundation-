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
@property (nonatomic, assign) NSInteger leftTickets;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)setBeijingStation:(NSThread *)beijingStation {
    _beijingStation = beijingStation;
    _beijingStation.name = @"北京站";
}
- (void)setShanghaiStation:(NSThread *)shanghaiStation {
    _shanghaiStation = shanghaiStation;
    _shanghaiStation.name = @"上海站";
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
    @synchronized (self) {
        while (self.leftTickets) {
            self.leftTickets--;
            NSLog(@"现在%@卖出一张票，还剩%ld张票", NSThread.currentThread.name, self.leftTickets);
            [NSThread sleepForTimeInterval:0.2];
        }
        NSLog(@"对不起，%@没票了", NSThread.currentThread.name);
    }
}
// MARK: - 线程不安全的购买车票
- (IBAction)unsafeBuyTicketButton:(UIButton *)sender {
    self.leftTickets = 50;
    self.beijingStation = [[NSThread alloc] initWithTarget:self selector:@selector(unsafeBuyTicket) object:nil];
    self.shanghaiStation = [[NSThread alloc] initWithTarget:self selector:@selector(unsafeBuyTicket) object:nil];
    [self.beijingStation start];
    [self.shanghaiStation start];
}
- (void)unsafeBuyTicket {
    while (self.leftTickets) {
        self.leftTickets--;
        NSLog(@"现在%@卖出一张票，还剩%ld张票", NSThread.currentThread.name, self.leftTickets);
        [NSThread sleepForTimeInterval:0.1];
    }
}
@end
