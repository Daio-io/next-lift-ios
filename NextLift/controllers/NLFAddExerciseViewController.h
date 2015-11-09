//
//  NLFAddExerciseViewController.h
//  NextLift
//
//  Created by Dai Williams on 03/10/2015.
//  Copyright © 2015 daio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NLFAddExerciseViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *addExerciseField;
@property (nonatomic, strong) NSString *groupName;

- (instancetype)initWithGroupName:(NSString *)groupName;

- (IBAction)addButtonClicked:(id)sender;
- (IBAction)cancelButton:(id)sender;

@end
