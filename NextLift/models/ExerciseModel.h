//
// Created by Dai Williams on 09/09/15.
// Copyright (c) 2015 daio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CBLModel.h"


@interface ExerciseModel : CBLModel

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *bodypart;
@property(nonatomic) int sets;
@property(nonatomic) double weight;
@property(nonatomic, strong) NSString *unit;

@end