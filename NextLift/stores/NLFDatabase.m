//
// Created by Dai Williams on 13/09/15.
// Copyright (c) 2015 daio. All rights reserved.
//

#import <Realm/realm/RLMRealm.h>
#import "NLFDatabase.h"
#import "RLMResults.h"
#import "NLFExercise.h"

@implementation NLFDatabase {
    RLMRealm *realm;
}

- (instancetype)initWithRealm:(RLMRealm *)rlmRealm {
    if (self = [super init]) {
        realm = rlmRealm;
    }
    return self;
}

- (RLMResults *)getAllExercises {
    RLMResults *r = [NLFExercise allObjects];
    return r;
}

- (RLMResults *)getAllExercisesForCatergory:(NSString *)category {
    NSString *query = [NSString stringWithFormat:@"category == '%@'", category];
    RLMResults *r = [NLFExercise objectsWhere:query];
    return r;
}

- (void)addExercise:(NLFExercise *)exerciseModel {
    [realm transactionWithBlock:^{
        [realm addObject:exerciseModel];
    }];
}


@end