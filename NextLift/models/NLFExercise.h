//
// Created by Dai Williams on 13/09/15.
// Copyright (c) 2015 daio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLMObject.h"

@class NLFBodyCatergory;

@interface NLFExercise : RLMObject;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *category;
@property (nonatomic) int sets;
@property (nonatomic) int reps;
@property (nonatomic) double weight;
@property (nonatomic, strong) NSString *unit;

@end