//
//  ViewController.m
//  UICollectionView
//
//  Created by 雷维卡 on 2019/1/23.
//

#import "ViewController.h"
// 用宏定义来定义 ID
#define ID @"collectionView"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
// MARK: - Collection view data source
// 设置 UICollectionViewCell 中的元素内容
- (__kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    /*
     注意：在创建 UICollectionView 的 cell 的时候，与 UITableViewCell 相类似。调用 collectionView dequeueReusableCellWithReuseIdentifier 方法。但是在调用这个方法之前，必须为 collectionView 注册一个 class 或者是一个 xib，或者是在 storyboard 上
            注册 class 的方法：
                registerClass:forCellWithReuseIdentifier:
            注册 xib 的方法：
                registerNib:forCellWithReuseIdentifier: method before calling this method.
            storyboard 上登记
     */
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}
// 设置 UICollectionView 显示多少个项目
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

@end
