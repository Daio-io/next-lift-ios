//
//  NLFMuscleGroupViewController.m
//  NextLift
//
//  Created by Dai Williams on 22/09/2015.
//  Copyright © 2015 daio. All rights reserved.
//

#import "NLFMuscleGroupViewController.h"
#import "NLFDatabaseFactory.h"
#import "NLFCollectionCell.h"
#import "NLFExerciseViewController.h"
#import "NLFColor.h"

@interface NLFMuscleGroupViewController ()

@property(nonatomic, strong) NLFDatabase *db;
@property(nonatomic, strong) RLMResults *categories;

@end

@implementation NLFMuscleGroupViewController

static NSString *const reuseIdentifier = @"NLFCollectionCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [NLFColor backgroundWhite];

    self.db = [NLFDatabaseFactory getInstance];
    [self.db addConsumer:self];
    self.categories = [self.db getAllCategories];
    UINib *cellNib = [UINib nibWithNibName:reuseIdentifier bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addMuscleGroup:(id)sender
{
    
}

#pragma mark - <NLFDatabaseDelegate>

- (void)categoryAdded
{
    self.categories = [self.db getAllCategories];
    [self.collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.categories.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    NLFCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NLFMuscleGroup *muscleGroup = [self.categories objectAtIndex:(NSUInteger) indexPath.row];
    cell.groupName.text = muscleGroup.name;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake(collectionViewLayout.collectionView.frame.size.width, 50);

}

#pragma mark <UICollectionViewDelegate>

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NLFMuscleGroup *group = [self.categories objectAtIndex:(NSUInteger) indexPath.row];

    NLFExerciseViewController *exercisesViewController = [[NLFExerciseViewController alloc] initWithName:group.name];
    [self.navigationController pushViewController:exercisesViewController animated:YES];
    return YES;
}

@end
