//
//  NLFAddExerciseViewController.m
//  NextLift
//
//  Created by Dai Williams on 03/10/2015.
//  Copyright © 2015 daio. All rights reserved.
//

#import "NLFAddExerciseViewController.h"
#import "NLFDatabase.h"
#import "NLFDatabaseFactory.h"

@interface NLFAddExerciseViewController ()
@property (nonatomic, strong) NLFDatabase *db;
@property (nonatomic, strong) NSString *groupName;
@end

@implementation NLFAddExerciseViewController

- (instancetype)initWithGroupName:(NSString *)groupName {
    if (self = [super init]) {
        _groupName = groupName;
        _db = [NLFDatabaseFactory getInstance];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Internal

- (void)addExercise:(NSString *)exerciseName
{
    NLFExercise *exercise = [NLFExercise new];
    exercise.name = exerciseName;
    exercise.unit = @"kg";
    exercise.sets = 0;
    exercise.weight = 0;
    exercise.reps = 0;
    exercise.group = self.groupName;
    [_db addExercise:exercise];
}

- (void)addButtonClicked:(id)sender
{

    if (self.addExerciseField.text.length > 0) {
        [self addExercise:_addExerciseField.text];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)cancelButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
