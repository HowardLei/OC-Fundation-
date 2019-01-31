//
//  ITCollectionViewController.m
//  英雄展示
//
//  Created by 雷维卡 on 2019/1/30.
//

#import "ITCollectionViewController.h"
#import "ITHero.h"
#import "ITHeroCell.h"
@interface ITCollectionViewController ()
@property (nonatomic, strong) NSArray<ITHero *> *modelArr;
@end

@implementation ITCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (NSArray<ITHero *> *)modelArr {
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
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return 0;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ITHeroCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.model = self.
    // Configure the cell
    return cell;
}

@end
