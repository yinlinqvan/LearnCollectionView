//
//  FirstCell.h
//  LearnCollectionView
//
//  Created by 印林泉 on 2017/7/24.
//  Copyright © 2017年 幸福钱庄. All rights reserved.
//

#import <UIKit/UIKit.h>

@implementation CALayer (Additions)

- (void)setBorderColorFromUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}
- (void)setShadowColorWithUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

@end

@interface FirstCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
