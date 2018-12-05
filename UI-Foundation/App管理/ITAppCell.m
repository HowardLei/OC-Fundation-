//
//  ITAppCell.m
//  App管理
//
//  Created by jyz on 2018/12/5.
//

#import "ITAppCell.h"

@interface ITAppCell ()
@property (weak, nonatomic) IBOutlet UIImageView *appImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *downloadButton;
- (IBAction)touchToDownload:(UIButton *)sender;

@end

@implementation ITAppCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setModel:(ITApp *)model {
    _model = model;
    [self setModelData:model];
}
- (void)setModelData:(ITApp *)model {
    self.appImageView.image = [UIImage imageNamed:model.icon];
    self.nameLabel.text = model.name;
    self.contentLabel.text = [NSString stringWithFormat:@"大小：%@ | 下载量：%@", self.model.size, self.model.download];
    self.downloadButton.enabled = !self.model.isDownloaded;
}
- (IBAction)touchToDownload:(UIButton *)sender {
    self.downloadButton.enabled = NO;
    self.model.downloaded = YES;
    // 点击完以后显示一个 Label 表示正在下载和下载成功
    if ([self.delegate respondsToSelector:@selector(showLabel)]) {
        [self.delegate showLabel];
    }
}
@end
