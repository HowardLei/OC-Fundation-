#import <Foundation/Foundation.h>
#import "Listener.h"
#import "Sender.h"
/*
 观察者模式总结：
 1、在这个设计模式下。有至少两组对象--观察者与被观察者。观察者负责观察数据的改变，当被观察者的数据发生改变的时候，观察者就会发现相应的改变，并作出相应的响应。这种模式能够确保界面与数据之间的独立性，降低其中的耦合度。
 2、在通知中，接受通知的相当于一个观察者，发送通知的相当于一个被观察者。当接受通知的人接收到发送通知的人的通知的时候，相当于观察者发现被观察者的数据发生了改动。这个时候观察者开始对被观察者修改数据的行为作出相应。
 3、观察者和被观察者之间不会主动的进行交流，防止两者之间紧耦合。需要用一个第三方对象来对其进行管理。因为根据面向对象的思想。每一个类应该只负责他这个类应该实现的功能，而不是雨露均沾。在这里，NSNotificationCenter 充当通知的管理者，所有的通知的发送到接收都由他来管理。发送者只负责通知的打包发送，接收者只负责通知的接收。
 4、在通知这个设计模式中，必须保证先有人监听，后有人发送。因为发送只是对有监听需要的对象进行发送。不会对没有监听需求的对象发送信息。
 */
/*
 通知的方法总结
 一、监听方法
 - (void)addObserver:监听者 selector:@selector(方法名) name:监听的通知名 object:监听谁的通知;
 注意：1、当只有 name 的参数值为 nil 的时候，则监听者会将被监听者中的所有方法全部监听到。
      2、当只有 object 的参数为 nil 的时候，则监听者将会监听到所有关于通知名相同的所有通知。
      3、当 name 和 object 的参数都为 nil 的时候，则监听者会监听 center 中的所有方法。（一般不建议使用）
 二、发布方法
 - (void)postNotification:(NSNotification *)notification;
 - (void)postNotificationName:(NSNotificationName)aName object:(nullable id)anObject;
 - (void)postNotificationName:通知名 object:被监听对象 userInfo:需要发送的通知外的其他信息。（字典存储）
 其中第一个方法是发送一个已经封装好的 NSNotification 的对象。第三个是将 NSNotification 所需要的属性分开添加，自动合成一个 NSNotification 对象。所以只将第三个方法的参数做了解释。注意：这个方法不能指定参数为 nil，否则会造成信息不清楚。
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Listener *listener = [[Listener alloc] init];
        Sender *sender = [[Sender alloc] init];
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        NSString *notificationName = @"精选";
        // 添加监听者的方法
        [center addObserver:listener selector:@selector(messageWithNotification:) name:notificationName object:sender];
        [center postNotificationName:notificationName object:sender userInfo:@{@"今日大事": @"周涛在宿舍中吵着嚷着上头条", @"新闻" : @"周大爷一直想上头条不成"}];
    }
    return 0;
}
