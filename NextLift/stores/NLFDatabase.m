//
// Created by Dai Williams on 13/09/15.
// Copyright (c) 2015 daio. All rights reserved.
//

#import <Realm/realm/RLMRealm.h>
#import "NLFDatabase.h"
#import "RLMResults.h"
#import "NLFExerciseModel.h"


@implementation NLFDatabase {
    RLMRealm *realm;
}

- (instancetype)init {
    if (self = [super init]) {
        realm = [RLMRealm defaultRealm];
    }
    return self;
}

- (RLMResults *)getAllExercises {
    RLMResults *r = [NLFExerciseModel allObjects];
    return r;
}

- (RLMResults *)getAllExercisesForBodypart:(NSString *)bodypart {
    NSString *query = [NSString stringWithFormat:@"bodypart == '%@'", bodypart];
    RLMResults *r = [NLFExerciseModel objectsWhere:query];
    return r;
}

- (void)addExercise:(NLFExerciseModel *)exerciseModel {
    [realm transactionWithBlock:^{
        [realm addObject:exerciseModel];
    }];
}


@end