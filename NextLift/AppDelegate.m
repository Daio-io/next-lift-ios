//
//  AppDelegate.m
//  NextLift
//
//  Created by Dai Williams on 08/09/2015.
//  Copyright (c) 2015 daio. All rights reserved.
//

#import <Realm/realm/RLMRealm.h>
#import "AppDelegate.h"
#import "NLFExercise.h"
#import "NLFDatabase.h"
#import "NLFDatabaseFactory.h"
#import "NLFBodyCategory.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    // Only here while testing
    NLFExercise *em = [NLFExercise new];
    NLFBodyCategory *bc = [NLFBodyCategory new];

    bc.name = @"Arms";

    em.name = @"Tricep Dip";
    em.category = @"Arms";
    em.reps = 8;
    em.sets = 3;
    em.unit = @"kg";
    em.weight = 20;

    NLFDatabase *db  = [NLFDatabaseFactory getInstance];

    [db addExercise:em];

    RLMResults *r = [db getAllExercisesForCatergory:bc.name];

    NSLog(@"%@", r);

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
