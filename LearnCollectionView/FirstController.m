//
//  FirstController.m
//  LearnCollectionView
//
//  Created by 印林泉 on 2017/7/25.
//  Copyright © 2017年 幸福钱庄. All rights reserved.
//

#import "FirstController.h"
#import "FirstCell.h"

#define LineSpacing 20
#define ItemLineSpacing 0

@interface FirstController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic)NSArray *data;
@property (strong, nonatomic)NSArray *sizeData;

@end

@implementation FirstController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    _data = @[@{@"sectionTitle": @"特别推荐", @"section":@[@{@"title": @"3.0使用说明会"},
                                                       @{@"title": @"3.0使用说明会"},
                                                       @{@"title": @"3.0使用说明会"},
                                                       @{@"title": @"3.0使用说明会"},
                                                       @{@"title": @"3.0使用说明会"},
                                                       ]
                }];
    _sizeData = @[
                  [NSValue valueWithCGSize:(CGSize){self.view.bounds.size.width/3.0, self.view.bounds.size.width/2.0}],
                  ];
    //1、已注册
    [self.collectionView registerNib:[UINib nibWithNibName:@"FirstCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    //    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

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
    //    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //    cell.backgroundColor = [UIColor redColor];
    FirstCell *cell = (FirstCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSDictionary *dictionary = _data[indexPath.section];
    NSArray *section = dictionary[@"section"];
    NSDictionary *row = section[indexPath.row];
    cell.titleLabel.text = row[@"title"];
    return cell;
}

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
    //    FirstCell *cell = (FirstCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //    cell.layer.borderColor = [UIColor redColor].CGColor;
    //    cell.layer.borderWidth = 2.0;
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    //    FirstCell *cell = (FirstCell *)[collectionView cellForItemAtIndexPath:indexPath];
    //    cell.layer.borderColor = [UIColor redColor].CGColor;
    //    cell.layer.borderWidth = 0.0;
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
    return (UIEdgeInsets){0, 0, 0, 0};
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return LineSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return ItemLineSpacing;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
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

@end
