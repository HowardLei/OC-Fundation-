#import "Language.h"
#import <Foundation/Foundation.h>

@interface Student : NSObject{
    Language *_language;
}
@property id obj;
@property NSString * name;
-(void)studyWithLanguage:(Language *)language;
@end
