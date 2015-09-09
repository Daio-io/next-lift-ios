//
//  NextLiftDatabase.m
//  NextLift
//
//  Created by Dai Williams on 09/09/2015.
//  Copyright (c) 2015 daio. All rights reserved.
//

#import "NextLiftDatabase.h"

NSString* const DATABASE_NAME = @"nextlift";

CBLDatabase *db;

@implementation NextLiftDatabase

- (instancetype)init
{
    if(self = [super init]){
        [self initialiseDatabase];
    }
    return self;
}

- (void)initialiseDatabase
{
    NSError *error;

    CBLManager *manager = [CBLManager sharedInstance];
    db = [manager databaseNamed:DATABASE_NAME error:&error];
    if (error) {
        NSLog(@"Error getting Databse, message %@", error.localizedDescription);
    }
}

@end
