//
//  AddCategoryViewController.m
//  NextLift
//
//  Created by Dai Williams on 16/09/2015.
//  Copyright (c) 2015 daio. All rights reserved.
//

#import "AddCategoryViewController.h"
#import "NLFDatabase.h"
#import "NLFDatabaseFactory.h"

@interface AddCategoryViewController ()
@property (nonatomic, strong) NLFDatabase *db;
@end

@implementation AddCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _db = [NLFDatabaseFactory getInstance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addCategoryButton:(id)sender {

    if (self.addCategoryField.text.length > 0) {
        NLFMuscleGroup *muscleGroup = [NLFMuscleGroup new];
        muscleGroup.name = _addCategoryField.text;
        [_db addMuscleGroup:muscleGroup];
        [self dismissViewControllerAnimated:YES completion:nil];
    }

}

@end
