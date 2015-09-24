//
//  MuscleGroupViewController.h
//  NextLift
//
//  Created by Dai Williams on 22/09/2015.
//  Copyright © 2015 daio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NLFDatabase.h"

@interface MuscleGroupViewController : UICollectionViewController <NLFDatabaseDelegate>

- (IBAction)addMuscleGroup:(id)sender;

@end
