//
// Created by Dai Williams on 13/09/15.
// Copyright (c) 2015 daio. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RLMResults;
@class NLFExerciseModel;


@interface NLFDatabase : NSObject

- (instancetype)initWithRealm:(RLMRealm *)realm;
- (RLMResults *)getAllExercises;
- (RLMResults *)getAllExercisesForBodypart:(NSString *)bodypart;
- (void)addExercise:(NLFExerciseModel *)exerciseModel;

@end