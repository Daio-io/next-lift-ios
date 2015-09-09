//
// Created by Dai Williams on 09/09/15.
// Copyright (c) 2015 daio. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ExerciseModel : NSObject

@property (nonatomic, strong) NSString *bodypart;
@property (nonatomic, strong) NSString *name;

- (instancetype)initWithName:(NSString *)n bodypart:(NSString *)b;

@end