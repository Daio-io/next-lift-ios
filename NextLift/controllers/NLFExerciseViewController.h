//
//  NLFExerciseViewController.h
//  NextLift
//
//  Created by Dai Williams on 26/09/2015.
//  Copyright © 2015 daio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NLFDatabase.h"

@interface NLFExerciseViewController : UICollectionViewController <NLFDatabaseDelegate>

- (instancetype)initWithName:(NSString *)name;


@end
