//
// Created by Dai Williams on 13/09/15.
// Copyright (c) 2015 daio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLMRealm.h"
#import "RLMResults.h"
#import "NLFExercise.h"
#import "NLFMuscleGroup.h"

@protocol NLFDatabaseDelegate <NSObject>
@optional
- (void)categoryAdded;
- (void)exerciseAdded;
@end

@interface NLFDatabase : NSObject

- (instancetype)initWithRealm:(RLMRealm *)realm;

- (void)addConsumer:(id<NLFDatabaseDelegate>)consumer;

- (RLMResults *)getAllExercises;
- (RLMResults *)getAllExercisesForMuscleGroup:(NSString *)muscleGroup;
- (RLMResults *)getAllCategories;
- (void)addExercise:(NLFExercise *)exerciseModel;
- (void)addMuscleGroup:(NLFMuscleGroup *)muscle;

@end