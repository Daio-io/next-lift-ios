//
//  NextLiftDatabase.m
//  NextLift
//
//  Created by Dai Williams on 09/09/2015.
//  Copyright (c) 2015 daio. All rights reserved.
//

#import "NextLiftDatabase.h"
#import "ExerciseModel.h"

NSString *const DATABASE_NAME = @"nextlift";

@implementation NextLiftDatabase

- (instancetype)init {
    if (self = [super init]) {
        [self initialiseDatabase];
    }
    return self;
}

- (void)initialiseDatabase {
    NSError *error;

    CBLManager *manager = [CBLManager sharedInstance];
    self.db = [manager databaseNamed:DATABASE_NAME error:&error];
    if (error) {
        NSLog(@"Error getting Database, message %@", error.localizedDescription);
    }
}


- (ExerciseModel *)addExerciseWithName:(NSString *)n bodypart:(NSString *)b sets:(int)s weight:(double)w unit:(NSString *)u
{
    NSError *error;
    ExerciseModel *model = [ExerciseModel modelForNewDocumentInDatabase:self.db];
    model.name = n;
    model.bodypart = b;
    model.sets = s;
    model.weight = w;
    model.unit = u;
    [model save:&error];
    return model;
}

- (NSArray *)getAllExercisesFor:(NSString *)bodypart {

    NSError *error;
    NSString *where = [NSString stringWithFormat:@"bodypart == '%@'", bodypart];
    CBLQueryBuilder *query = [[CBLQueryBuilder alloc]
            initWithDatabase:self.db
                      select:@[@"name"]
                       where:where
                     orderBy:@[@"-date"]
                       error:&error];

    if (error) {
        NSLog(@"No data found for %@", bodypart);
        return nil;
    }

    NSError *err;
    CBLQueryEnumerator *e = [query runQueryWithContext:nil
                                                 error:&err];


    if (e) {
        return e.allObjects;
    } else {
        NSLog(@"Error  %@", err.localizedDescription);
        return nil;
    }

}

- (NSArray *)getAllBodyparts {
    return nil;
}


@end
