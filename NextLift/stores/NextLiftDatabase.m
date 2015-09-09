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

CBLDatabase *db;

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
    db = [manager databaseNamed:DATABASE_NAME error:&error];
    if (error) {
        NSLog(@"Error getting Databse, message %@", error.localizedDescription);
    }
}

- (NSString *)addExercise:(ExerciseModel *)exerciseModel {

    NSError *error;

    CBLDocument *doc = [db createDocument];

    NSDictionary *exDict = @{@"name" : exerciseModel.name, @"bodypart" : exerciseModel.bodypart};

    CBLRevision *revision = [doc putProperties:exDict error:&error];

    if (!revision) {
        NSLog(@"Unable to write document to database, Error: %@", error.localizedDescription);
        return nil;
    }

    return doc.documentID;
}

- (NSArray *)getAllExercises {
    return nil;
}


@end
