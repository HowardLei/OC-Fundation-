//
//  ITContactCell.m
//  私人通讯录
//
//  Created by apple on 2019/3/8.
//

#import "ITContactCell.h"
#import "ITContact.h"

@interface ITContactCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@end

@implementation ITContactCell
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.nameLabel.text = self.model.name;
        self.phoneNumberLabel.text = self.model.phoneNumber;
    }
    return self;
}
@end
