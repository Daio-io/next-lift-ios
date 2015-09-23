//
//  MuscleGroupViewController.m
//  NextLift
//
//  Created by Dai Williams on 22/09/2015.
//  Copyright © 2015 daio. All rights reserved.
//

#import "MuscleGroupViewController.h"
#import "NLFDatabaseFactory.h"
#import "MuscleGroupCell.h"

@interface MuscleGroupViewController ()

@property(nonatomic, strong) NLFDatabase *db;
@property(nonatomic, strong) RLMResults *categories;

@end

@implementation MuscleGroupViewController

static NSString * const reuseIdentifier = @"Group";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.db = [NLFDatabaseFactory getInstance];
    [self.db addConsumer:self];
    self.categories = [self.db getAllCategories];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.categories.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NLFMuscleGroup *muscleGroup = [self.categories objectAtIndex:(NSUInteger) indexPath.row];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MuscleGroupCell" owner:self options:nil];
    MuscleGroupCell *cell = nib[0];

    cell.groupName.text = muscleGroup.name;
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
