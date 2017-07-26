//
//  AppStoreController.m
//  LearnCollectionView
//
//  Created by 印林泉 on 2017/7/21.
//  Copyright © 2017年 幸福钱庄. All rights reserved.
//

#import "AppStoreController.h"
#import "FirstCell.h"

#define LineSpacing 20
#define ItemLineSpacing 20

@interface AppStoreController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic)NSArray *data;
@property (strong, nonatomic)NSArray *sizeData;

@end

@implementation AppStoreController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _data = @[@{@"sectionTitle": @"推荐课程", @"section":@[@{@"title": @"传授英式发音正确打开方式", @"price": @"1999"},
                                                       @{@"title": @"分享：编程先导热身", @"price": @"1999"},
                                                       @{@"title": @"分享：编程先导热身", @"price": @"1999"}]},
              @{@"sectionTitle": @"特别推荐", @"section":@[@{@"title": @"3.0使用说明会"},
                                                       ]
                },
              @{@"sectionTitle": @"推荐文章", @"section":@[@{@"title": @"优秀程序员都有哪些习惯？"},
                                                       ]
                },
              @{@"sectionTitle": @"推荐频道", @"section":@[@{@"title": @"什么都研究所"},
                                                       @{@"title": @"灌水区"},
                                                       @{@"title": @"写作互评小组"},
                                                       @{@"title": @"早起兴趣小组"},
                                                       @{@"title": @"吐槽大会"},
                                                       @{@"title": @"编程兴趣小组"},
                                                       @{@"title": @"通识兴趣小组"},
                                                       @{@"title": @"我在北上广深"}]},
              ];

    _sizeData = @[[NSValue valueWithCGSize:(CGSize){(self.view.bounds.size.width - 20*2), (self.view.bounds.size.width- 20*2)/2.0 + 92}],
                  [NSValue valueWithCGSize:(CGSize){(self.view.bounds.size.width- 20*2), (self.view.bounds.size.width- 20*2)/2.0}],
                  [NSValue valueWithCGSize:(CGSize){150, 150*1.5}],
                  [NSValue valueWithCGSize:(CGSize){(self.view.bounds.size.width- 20*3)/2.0, (self.view.bounds.size.width- 20*3)/2.0}]
                  ];
//    _sizeData = @[
//                  [NSValue valueWithCGSize:(CGSize){(self.view.bounds.size.width- 20*3)/2.0, (self.view.bounds.size.width- 20*3)/2.0}],
//                  [NSValue valueWithCGSize:(CGSize){(self.view.bounds.size.width- 20*3)/2.0, (self.view.bounds.size.width- 20*3)/2.0}],
//                  [NSValue valueWithCGSize:(CGSize){(self.view.bounds.size.width- 20*3)/2.0, (self.view.bounds.size.width- 20*3)/2.0}],
//                  [NSValue valueWithCGSize:(CGSize){(self.view.bounds.size.width- 20*3)/2.0, (self.view.bounds.size.width- 20*3)/2.0}],
//                  ];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[FirstCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"FirstCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    //UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return _data.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSDictionary *dictionary = _data[section];
    NSArray *array = dictionary[@"section"];
    return array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FirstCell *cell = (FirstCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSDictionary *dictionary = _data[indexPath.section];
    NSArray *section = dictionary[@"section"];
    NSDictionary *row = section[indexPath.row];
    cell.titleLabel.text = row[@"title"];
    return cell;
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        UICollectionReusableView *header = [[UICollectionReusableView alloc] initWithFrame:(CGRect){400, 200}];
//        [header setBackgroundColor:[UIColor blackColor]];
//        return header;
//    }
//    else /*if ([kind isEqualToString:UICollectionElementKindSectionFooter])*/ {
//        UICollectionReusableView *footer = [[UICollectionReusableView alloc] initWithFrame:(CGRect){400, 50}];
//
//        [footer setBackgroundColor:[UIColor lightGrayColor]];
//        return footer;
//    }
//}

//- layoutAttributesForItem
#pragma mark <UICollectionViewDelegate>

// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    FirstCell *cell = (FirstCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.layer.borderColor = [UIColor redColor].CGColor;
    cell.layer.borderWidth = 2.0;
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    FirstCell *cell = (FirstCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.layer.borderColor = [UIColor redColor].CGColor;
    cell.layer.borderWidth = 0.0;
}
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

// 使copy和paste有效
- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    if ([NSStringFromSelector(action) isEqualToString:@"copy:"] || [NSStringFromSelector(action) isEqualToString:@"paste:"]) {
        return YES;
    }
    return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender {
    if([NSStringFromSelector(action) isEqualToString:@"copy:"]) {
        NSLog(@"-------------执行拷贝-------------");
    }
    else if([NSStringFromSelector(action) isEqualToString:@"paste:"]) {
        NSLog(@"-------------执行粘贴-------------");
    }
}

#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSValue *value = _sizeData[indexPath.section];
    CGSize size = value.CGSizeValue;
    return size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return (UIEdgeInsets){20, 20, 20, 20};
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return LineSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return ItemLineSpacing;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return (CGSize){self.view.bounds.size.width-20, 20};
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return (CGSize){self.view.bounds.size.width-40, 20};
}

@end
