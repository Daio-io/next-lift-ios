//
//  NLFAddGroupViewController.m
//  NextLift
//
//  Created by Dai Williams on 16/09/2015.
//  Copyright (c) 2015 daio. All rights reserved.
//

#import "NLFAddGroupViewController.h"
#import "NLFDatabase.h"
#import "NLFDatabaseFactory.h"

@interface NLFAddGroupViewController ()
@property (nonatomic, strong) NLFDatabase *db;
@end

@implementation NLFAddGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _db = [NLFDatabaseFactory getInstance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Internal

- (void)addMuscleGroup:(NSString *)groupName {
    NLFMuscleGroup *muscleGroup = [NLFMuscleGroup new];
    muscleGroup.name = groupName;
    [_db addMuscleGroup:muscleGroup];
}

- (void)addGroupButtonClicked:(id)sender {

    if (self.addGroupField.text.length > 0) {
        [self addMuscleGroup:_addGroupField.text];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
