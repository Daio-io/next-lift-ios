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

@property(nonatomic, strong) CBLDatabase *db;
@property(nonatomic, strong) CBLQueryBuilder *queryBuilder;

- (ExerciseModel *)addExerciseWithName:(NSString *)n
                              bodypart:(NSString *)b
                                  sets:(int)s
                                weight:(double)w
                                  unit:(NSString *)u;

- (NSArray *)getAllExercisesFor:(NSString *)bodypart;

- (NSArray *)getAllBodyparts;

@end
