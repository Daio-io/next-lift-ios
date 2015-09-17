//
//  ExercisesViewController.h
//  NextLift
//
//  Created by Dai Williams on 17/09/2015.
//  Copyright © 2015 daio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NLFDatabase.h"

@interface ExercisesViewController : UITableViewController <NLFDatabaseDelegate>
@property (weak, nonatomic) IBOutlet UINavigationItem *exerciseNavBar;

- (instancetype)initWithTitle:(NSString *)title;

@end
