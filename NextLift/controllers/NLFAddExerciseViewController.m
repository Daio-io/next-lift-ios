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
@end

@implementation NLFAddExerciseViewController

- (instancetype)initWithGroupName:(NSString *)groupName {
    if (self = [super init]) {
        _groupName = groupName;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.db = [NLFDatabaseFactory getInstance];
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
    [self.db addExercise:exercise];
    
}


- (IBAction)addButtonClicked:(id)sender
{
    if (self.addExerciseField.text.length > 0) {
        [self addExercise:_addExerciseField.text];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
  
}

- (IBAction)cancelButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
