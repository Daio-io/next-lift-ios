//
// Created by Dai Williams on 13/09/15.
// Copyright (c) 2015 daio. All rights reserved.
//

#import "NLFDatabaseFactory.h"
#import "NLFDatabase.h"
#import "RLMRealm.h"

@implementation NLFDatabaseFactory

static NLFDatabase *database = nil;

+ (NLFDatabase *)getInstance {
    if (!database) {
        database = [[NLFDatabase alloc] initWithRealm:[RLMRealm defaultRealm]];
    }
    return database;
}

@end