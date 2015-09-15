//
// Created by Dai Williams on 13/09/15.
// Copyright (c) 2015 daio. All rights reserved.
//

#import <Realm/realm/RLMRealm.h>
#import "NLFDatabase.h"

@implementation NLFDatabase {
    RLMRealm *realm;
    NSMutableArray *consumers;
}

- (instancetype)initWithRealm:(RLMRealm *)rlmRealm {
    if (self = [super init]) {
        realm = rlmRealm;
        consumers = [NSMutableArray new];
    }
    return self;
}

- (void)addConsumer:(id <NLFDatabaseDelegate>)consumer {
    [consumers addObject:consumer];
}

#pragma mark - NLFDatabase

- (RLMResults *)getAllExercises {
    RLMResults *r = [NLFExercise allObjects];
    return r;
}

- (RLMResults *)getAllExercisesForMuscleGroup:(NSString *)group {
    NSString *query = [NSString stringWithFormat:@"group == '%@'", group];
    RLMResults *r = [NLFExercise objectsWhere:query];
    return r;
}

- (RLMResults *)getAllCategories {
    RLMResults *r = [NLFMuscleGroup allObjects];
    return r;
}

- (void)addExercise:(NLFExercise *)exerciseModel {
    [realm transactionWithBlock:^{
        [realm addOrUpdateObject:exerciseModel];
    }];
    for (id<NLFDatabaseDelegate> consumer in consumers) {
        if([consumer respondsToSelector:@selector(exerciseAdded)]){
            [consumer exerciseAdded];
        }
    }
}

- (void)addMuscleGroup:(NLFMuscleGroup *)muscleGroup {
    [realm transactionWithBlock:^{
        [realm addOrUpdateObject:muscleGroup];
    }];
    for (id<NLFDatabaseDelegate> consumer in consumers) {
        if([consumer respondsToSelector:@selector(categoryAdded)]){
            [consumer categoryAdded];;
        }
    }
}

@end