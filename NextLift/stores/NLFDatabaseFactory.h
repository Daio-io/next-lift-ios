//
// Created by Dai Williams on 13/09/15.
// Copyright (c) 2015 daio. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NLFDatabase;


@interface NLFDatabaseFactory : NSObject

+ (NLFDatabase *)getInstance;

@end