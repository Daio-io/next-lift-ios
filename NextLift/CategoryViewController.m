//
//  CategoryViewController.m
//  NextLift
//
//  Created by Dai Williams on 14/09/2015.
//  Copyright (c) 2015 daio. All rights reserved.
//

#import "CategoryViewController.h"
#import "NLFDatabase.h"
#import "NLFDatabaseFactory.h"

@interface CategoryViewController ()

@property (nonatomic, strong) NLFDatabase *db;

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.db = [NLFDatabaseFactory getInstance];
    [self.db addConsumer:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NLFDatabaseDelegate

- (void)categoryAdded {
    NSLog(@"Added New Category");
    RLMResults *r = [self.db getAllCategories];
    for (NLFBodyCategory *b in r){
        NSLog(@"%@", b.name);
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
