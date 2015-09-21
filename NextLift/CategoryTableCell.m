//
//  CategoryTableCell.m
//  NextLift
//
//  Created by Dai Williams on 15/09/2015.
//  Copyright (c) 2015 daio. All rights reserved.
//

#import "CategoryTableCell.h"
#import "NLFColor.h"

@implementation CategoryTableCell

@synthesize nameLabel = _nameLabel;

- (void)awakeFromNib {
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [NLFColor backgroundSelectedBlack];
    self.selectedBackgroundView = bgColorView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
