//
//  DatabaseService.m
//  NextLift
//
//  Created by Dai Williams on 09/09/2015.
//  Copyright (c) 2015 daio. All rights reserved.
//

#import "DatabaseService.h"

@implementation DatabaseService

-(instancetype)init
{
    self = [super init];

    if (self) {
        self.manager = [CBLManager sharedInstance];
    }
    return self;
}

- (CBLDatabase *)getDatabase:(NSString *)name {

    NSError *error;

    CBLDatabase *db = [self.manager databaseNamed:name error:&error];

    if (!db) {
        NSLog(@"Failed to get DB, message: %@", error);
        return nil;
    }
    return db;
}


@end
