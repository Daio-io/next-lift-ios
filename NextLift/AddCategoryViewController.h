//
//  AddCategoryViewController.h
//  NextLift
//
//  Created by Dai Williams on 16/09/2015.
//  Copyright (c) 2015 daio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddCategoryViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *addCategoryField;

- (IBAction)addCategoryButton:(id)sender;

@end
