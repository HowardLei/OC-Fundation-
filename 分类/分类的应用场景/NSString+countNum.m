//
//  NSString+countNum.m
//  分类的应用场景
//
//  Created by jyz on 2018/5/28.
//

#import "NSString+countNum.h"

@implementation NSString (countNum)
// MARK: 统计字符串中的数字数量
- (unsigned int)countNumberInString:(NSString *)str {
    unsigned int num = 0;
    for (int i = 0; i < str.length; i++) {
        unichar c = [str characterAtIndex:i];
        // 注意：这是查找字符是不是数字，所以需要在前面加上单引号。
        if (c >= '0' && c <= '9') {
            num++;
        }
    }
    return num;
}
@end
