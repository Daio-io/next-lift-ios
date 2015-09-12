//
//  NextLiftDatabase.h
//  NextLift
//
//  Created by Dai Williams on 09/09/2015.
//  Copyright (c) 2015 daio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CouchbaseLite/CouchbaseLite.h"

@class ExerciseModel;

@interface NextLiftDatabase : NSObject

@property (nonatomic, strong) CBLDatabase *db;

- (NSString *)addExercise:(ExerciseModel *)exerciseModel;
- (NSArray *)getAllExercisesFor:(NSString *)bodypart;

@end
