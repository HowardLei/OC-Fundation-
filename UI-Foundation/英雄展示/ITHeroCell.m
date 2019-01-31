//
//  ITHeroCell.m
//  英雄展示
//
//  Created by 雷维卡 on 2019/1/30.
//

#import "ITHeroCell.h"
#import "ITHero.h"

@interface ITHeroCell ()

@end

@implementation ITHeroCell
- (void)setModel:(ITHero *)model {
    _model = model;
    model.name = @"<#string#>"
}
@end
