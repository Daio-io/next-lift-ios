//
//  CategoryViewController.m
//  NextLift
//
//  Created by Dai Williams on 14/09/2015.
//  Copyright (c) 2015 daio. All rights reserved.
//

#import "CategoryViewController.h"
#import "NLFDatabaseFactory.h"

@interface CategoryViewController ()

@property (nonatomic, strong) NLFDatabase *db;
@property (nonatomic, strong) RLMResults *categories;

@end

static NSString *cellIdentifier = @"category";

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.db = [NLFDatabaseFactory getInstance];
    [self.db addConsumer:self];
    self.categories = [self.db getAllCategories];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NLFDatabaseDelegate

- (void)categoryAdded {
    self.categories = [self.db getAllCategories];
    [self.tableView reloadData];
}

#pragma mark - <UITableViewDelegate>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NLFBodyCategory *bodyCategory = [self.categories objectAtIndex:(NSUInteger) indexPath.row];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = bodyCategory.name;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NLFBodyCategory *bodyCategory = [self.categories objectAtIndex:(NSUInteger) indexPath.row];

    NSLog(@"Clicked %@", bodyCategory.name);
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
