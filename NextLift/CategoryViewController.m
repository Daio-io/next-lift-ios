//
//  CategoryViewController.m
//  NextLift
//
//  Created by Dai Williams on 14/09/2015.
//  Copyright (c) 2015 daio. All rights reserved.
//

#import "CategoryViewController.h"
#import "NLFDatabaseFactory.h"
#import "CategoryTableCell.h"

@interface CategoryViewController ()

@property(nonatomic, strong) NLFDatabase *db;
@property(nonatomic, strong) RLMResults *categories;

@end

static NSString *cellIdentifier = @"category";

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.db = [NLFDatabaseFactory getInstance];
    [self.db addConsumer:self];
    self.categories = [self.db getAllCategories];
    [self.tableView registerClass:[CategoryTableCell class] forCellReuseIdentifier:cellIdentifier];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NLFMuscleGroup *bodyCategory = [self.categories objectAtIndex:(NSUInteger) indexPath.row];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CategoryTableCell" owner:self options:nil];
    CategoryTableCell *cell = nib[0];

    cell.nameLabel.text = bodyCategory.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NLFMuscleGroup *bodyCategory = [self.categories objectAtIndex:(NSUInteger) indexPath.row];

    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}


@end
