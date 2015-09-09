//
// Created by Dai Williams on 09/09/15.
// Copyright (c) 2015 daio. All rights reserved.
//

#import "NextLiftDatabaseFactory.h"

@implementation NextLiftDatabaseFactory

NextLiftDatabase *database;

+(NextLiftDatabase *)getInstance
{
    if(!database) {
        database = [NextLiftDatabase new];
    }
    return database;
}
@end