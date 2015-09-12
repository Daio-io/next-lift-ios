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
        NSLog(@"Error getting Databse, message %@", error.localizedDescription);
    }
}

- (NSString *)addExercise:(ExerciseModel *)exerciseModel {

    NSError *error;

    CBLDocument *doc = [self.db createDocument];

    NSDictionary *exDict = @{@"name" : exerciseModel.name,
            @"bodypart" : exerciseModel.bodypart,
            @"sets" : @(exerciseModel.sets),
            @"weight" : @(exerciseModel.weight),
            @"unit" : exerciseModel.unit};

    CBLRevision *revision = [doc putProperties:exDict error:&error];

    if (!revision) {
        NSLog(@"Unable to write document to database, Error: %@", error.localizedDescription);
        return nil;
    }

    return doc.documentID;
}

- (NSArray *)getAllExercisesFor:(NSString *)bodypart {

    NSError *error;

    NSString *where = [NSString stringWithFormat:@"bodypart == '%@'", bodypart];
    CBLQueryBuilder *query = [[CBLQueryBuilder alloc]
            initWithDatabase:self.db
                      select:@[@"name", @"bodypart"]
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
        NSLog(@"found %@ ", e.allObjects);
        return e.allObjects;
    } else {
        NSLog(@"Error  %@", err.localizedDescription);
        return nil;
    }

}

@end
