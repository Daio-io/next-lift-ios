//
// Created by Dai Williams on 09/09/15.
// Copyright (c) 2015 daio. All rights reserved.
//

#import "ExerciseModel.h"


@implementation ExerciseModel

@synthesize name = _name, bodypart = _bodypart, sets = _sets, weight = _weight, unit = _unit;

- (instancetype)initWithName:(NSString *)n bodypart:(NSString *)b sets:(int)s weight:(double)w unit:(NSString *)u {

    if (self = [super init]) {
        _name = n;
        _bodypart = b;
        _sets = s;
        _weight = w;
        _unit = u;
    }
    return self;

}

@end