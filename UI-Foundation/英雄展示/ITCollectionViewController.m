//
//  ITCollectionViewController.m
//  英雄展示
//
//  Created by 雷维卡 on 2019/1/30.
//

#import "ITCollectionViewController.h"
#import "ITHero.h"
#import "ITHeroCell.h"
@interface ITCollectionViewController () <UICollectionViewDelegate>
@property (nonatomic, strong) NSMutableArray<ITHero *> *modelArr;
@end

@implementation ITCollectionViewController
static NSString *const reuseIdentifier = @"Cell";
#pragma mark Lazy loading data
- (__kindof NSArray<ITHero *> *)modelArr {
    if (_modelArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heroes" ofType:@".plist"];
        NSArray *tempArr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray<ITHero *> *arrM = [NSMutableArray array];
        for (NSDictionary *dict in tempArr) {
            ITHero *appModel = [ITHero heroWithDict:dict];
            [arrM addObject:appModel];
        }
        _modelArr = arrM;
    }
    return _modelArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.modelArr.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ITHeroCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.model = self.modelArr[indexPath.row];
    // Configure the cell
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
// 设置哪个 cell 会显示菜单，如果都显示则返回值为 YES，如果精确定位到哪个 cell，通过 indexPath 参数访问即可。
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
// 设置 cell 当中可以显示的选项
- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender {
    if (action == @selector(copy:) || action == @selector(paste:)) {
        return YES;
    } else {
        return NO;
    }
}
// 设置点击了哪个选项以后执行什么事件
- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender {
    // 创建一个剪切板。注意：剪切板分为公共的和私有的。调用 generalPasteboard 获得的剪切板为公共剪切板
    UIPasteboard *board = UIPasteboard.generalPasteboard;
    // 获得需要复制的模型
    ITHero *model = nil;
    // 根据你点击的按钮，作出相应的事件。由于设置好两个按键，所以直接用 if-else 结构即可。
    if (action == @selector(copy:)) {
        model = self.modelArr[indexPath.row];
        // 将数据添加到剪切板上
        board.strings = @[model.name, model.icon, model.intro];
    } else {
        NSArray<NSString *> *keys = @[@"name", @"icon", @"intro"];
        NSArray<NSString *> *values = board.strings;
        NSDictionary<NSString *, NSString *> *modelDict = [NSDictionary dictionaryWithObjects:values forKeys:keys];
        // FIXME: 这个地方为什么不能直接 copy 原对象的副本？
        model = [ITHero heroWithDict:modelDict];
        [self.modelArr insertObject:model atIndex:indexPath.row];
        [collectionView insertItemsAtIndexPaths:@[indexPath]];
    }
}

@end
