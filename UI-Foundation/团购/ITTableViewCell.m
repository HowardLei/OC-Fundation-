#import "ITTableViewCell.h"
#import "ITWeibo.h"

@interface ITTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabel;
@end

@implementation ITTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
// 重写 goods 属性的 setter 方法
- (void)setGoods:(ITGoods *)goods {
    _goods = goods;
    self.iconView.image = [UIImage imageNamed:goods.icon];
    self.titleLabel.text = goods.title;
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %@", goods.price];
    self.buyCountLabel.text = [NSString stringWithFormat:@"%@ 人已购买", goods.buyCount];
}

/**
 创建单元格
 @param tableView 当前的 tableView
 @return instancetype
 */
+ (instancetype)tableViewCellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"good_cell";
    ITTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ITGoodsCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

@end
