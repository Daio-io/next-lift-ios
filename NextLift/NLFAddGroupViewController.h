//
//  NLFAddGroupViewController.h
//  NextLift
//
//  Created by Dai Williams on 16/09/2015.
//  Copyright (c) 2015 daio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NLFAddGroupViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *addGroupField;

- (IBAction)addGroupButtonClicked:(id)sender;
- (IBAction)cancelButton:(id)sender;

@end
