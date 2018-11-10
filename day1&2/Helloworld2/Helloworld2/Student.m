//
//  Student.m
//  Helloworld2
//
//  Created by jyz on 2018/11/8.
//  Copyright © 2018 jyz. All rights reserved.
//

#import "Student.h"

@implementation Student
- (void)showID {
    NSLog(@"%@", _ID);
}
- (NSString *)compareScoreWithStudent:(Student *)student {
    if (_score < student->_score) {
        return @"小于";
    } else if (_score > student->_score) {
        return @"大于";
    } else {
        return @"等于";
    }
}
@end
