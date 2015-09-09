//
// Created by Dai Williams on 09/09/15.
// Copyright (c) 2015 daio. All rights reserved.
//

#import "ExerciseModel.h"


@implementation ExerciseModel

@synthesize name = _name, bodypart = _bodypart;

- (instancetype)initWithName:(NSString *)n bodypart:(NSString *)b {

    if (self = [super init]) {
        _name = n;
        _bodypart = b;
    }
    return self;
}

@end