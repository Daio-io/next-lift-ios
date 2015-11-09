//
// Created by Dai Williams on 13/09/15.
// Copyright (c) 2015 daio. All rights reserved.
//

#import <Realm/realm/RLMRealm.h>
#import "NLFDatabase.h"


@interface NLFDatabase()
@property (nonatomic, strong) RLMRealm *realm;
@property (nonatomic, strong) NSHashTable *consumers;
@end

@implementation NLFDatabase

- (instancetype)initWithRealm:(RLMRealm *)rlmRealm {
    if (self = [super init]) {
        _realm = rlmRealm;
        _consumers = [NSHashTable weakObjectsHashTable];
    }
    return self;
}

- (void)addConsumer:(id <NLFDatabaseDelegate>)consumer {
    
    [self.consumers addObject:consumer];
    NSLog(@"here %@", self.consumers);
    
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
    
    [self.realm transactionWithBlock:^{
        [self.realm addOrUpdateObject:exerciseModel];
    }];
    for (id<NLFDatabaseDelegate> consumer in self.consumers) {
        NSLog(@"here %@", consumer);
        
        if([consumer respondsToSelector:@selector(exerciseAdded)]){
            [consumer exerciseAdded];
        }
    }
}

- (void)addMuscleGroup:(NLFMuscleGroup *)muscleGroup {
    [self.realm transactionWithBlock:^{
        [self.realm addOrUpdateObject:muscleGroup];
    }];
    for (id<NLFDatabaseDelegate> consumer in self.consumers) {
        if([consumer respondsToSelector:@selector(categoryAdded)]){
            [consumer categoryAdded];;
        }
    }
}

@end