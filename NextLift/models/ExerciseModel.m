//
// Created by Dai Williams on 09/09/15.
// Copyright (c) 2015 daio. All rights reserved.
//

#import "ExerciseModel.h"


@implementation ExerciseModel

@dynamic name, bodypart, sets, weight, unit;

+ (NSString*) docType {
    return @"exercise";
}

@end