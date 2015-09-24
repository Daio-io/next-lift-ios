//
//  MuscleGroupCell.m
//  NextLift
//
//  Created by Dai Williams on 23/09/2015.
//  Copyright © 2015 daio. All rights reserved.
//

#import "MuscleGroupCell.h"
#import "NLFColor.h"

@implementation MuscleGroupCell

@synthesize groupName = _groupName;

- (void)awakeFromNib {
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [NLFColor backgroundSelectedBlack];
    self.selectedBackgroundView = bgColorView;
    [self sizeToFit];
}

@end
