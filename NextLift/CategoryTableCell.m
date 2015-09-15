//
//  CategoryTableCell.m
//  NextLift
//
//  Created by Dai Williams on 15/09/2015.
//  Copyright (c) 2015 daio. All rights reserved.
//

#import "CategoryTableCell.h"

@implementation CategoryTableCell

@synthesize nameLabel = _nameLabel;

- (void)awakeFromNib {
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor colorWithRed:0.216 green:0.278 blue:0.31 alpha:1];
    self.selectedBackgroundView = bgColorView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
