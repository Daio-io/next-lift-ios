//
//  DatabaseService.h
//  NextLift
//
//  Created by Dai Williams on 09/09/2015.
//  Copyright (c) 2015 daio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CouchbaseLite/CouchbaseLite.h"

@interface DatabaseService : NSObject

@property (strong, nonatomic) CBLManager *manager;

- (CBLDatabase *)getDatabase:(NSString *)name;

@end
