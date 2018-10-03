#import "ITHeaderView.h"

@interface ITHeaderView ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ITHeaderView
// 在已启动一个 App 的时候，每个加载 nib 文件的对象（这些对象和消息已经被加载完成和初始化了）都会收到一个 awakeFromNib 的消息。当他们收到这个消息的时候，他们的 outlet 和 action 连接就已经被建立起来了（摘录自：awakeFromNib 文档当中）。
// 在这个方法中，实现 nib 中控件属性的设置
- (void)awakeFromNib {
    CGFloat imageHeight = 220;
    CGFloat imageWidth = 353;
    int images = 5;
    self.scrollView.contentSize = CGSizeMake(imageWidth * images, imageHeight);
    // 注意：一旦重写这个方法，必须要调用其父类方法。
    [super awakeFromNib];
}
+ (instancetype)headerViewFromNib:(NSString *)nib {
    ITHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:nib owner:nil options:nil] lastObject];
    return headerView;
}
@end
