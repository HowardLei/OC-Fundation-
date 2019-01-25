#import "ViewController.h"
#define ID @"cell"
/*
 用代码创建 Collection view
 */
@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createACollectionView];
}
- (void)createACollectionView {
    // 1、先创建一个 CollectionView 的布局。因为通过 Storyboard 创建的 CollectionView 就自带流式布局。而通过代码创建的 view 并没有。所以需要先创建流式布局才能创建创建 CollectionView
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(60, 60);
    // 2、创建一个 CollectionView ，注意：创建的时候需要初始化 frame 的时候，设置为当前 view 的 bounds。布局看需求。如果需要修改布局当中的数据的时候就创建一个对象，如果没有就可以直接创建一个匿名对象。
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    // 3、设置代理与数据源方法的代理
    collectionView.dataSource = self;
    collectionView.delegate = self;
    // 4、设置属性
    collectionView.backgroundColor = [UIColor whiteColor];
    // 5、为 CollectionView 的 cell 进行注册
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    // 6、将 CollectionView 添加到控制器当中的 view 中
    [self.view addSubview:collectionView];
}
// MARK: - Collection view data source
- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

@end
