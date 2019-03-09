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

- (void)setModel:(ITContact *)model {
    _model = model;
    self.nameLabel.text = model.name;
    self.phoneNumberLabel.text = model.phoneNumber;
}
@end
