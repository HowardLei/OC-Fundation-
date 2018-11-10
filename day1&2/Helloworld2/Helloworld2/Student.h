//
//  Student.h
//  Helloworld2
//
//  Created by jyz on 2018/11/8.
//  Copyright © 2018 jyz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject
{
    @public
    NSString *_ID;
    int _score;
}
- (void)showID;
- (NSString *)compareScoreWithStudent:(Student *)student;
@end

NS_ASSUME_NONNULL_END
