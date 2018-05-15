#import <Foundation/Foundation.h>

@interface Person : NSObject
typedef enum{
    GenderFemale,GenderMale
}Gender;
// 姓名
@property(nonatomic, copy) NSString *name;
// 性别（枚举）
@property(nonatomic, assign) Gender gender;
// 年龄
@property(nonatomic, assign) int age;
// 身高
@property(nonatomic, assign) double height;
@end
