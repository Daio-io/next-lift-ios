//
//  NLFExerciseViewController.m
//  NextLift
//
//  Created by Dai Williams on 26/09/2015.
//  Copyright © 2015 daio. All rights reserved.
//

#import "NLFExerciseViewController.h"
#import "NLFDatabaseFactory.h"
#import "NLFCollectionCell.h"
#import "NLFColor.h"

@interface NLFExerciseViewController ()
@property (nonatomic, strong) NSString *exerciseName;
@property (nonatomic, strong) NLFDatabase *db;
@property(nonatomic, strong) RLMResults *exercises;
@end

@implementation NLFExerciseViewController

static NSString *const reuseIdentifier = @"NLFCollectionCell";

- (instancetype)initWithName:(NSString *)name {

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];

    if (self = [super initWithCollectionViewLayout:flowLayout]) {
        self.exerciseName = name;
        self.db = [NLFDatabaseFactory getInstance];
        self.exercises = [self.db getAllExercisesForMuscleGroup:self.exerciseName];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [NLFColor backgroundWhite];
    [self.collectionView sizeToFit];
    UINib *cellNib = [UINib nibWithNibName:reuseIdentifier bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.exercises.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    NLFCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NLFExercise *exercise = [self.exercises objectAtIndex:(NSUInteger) indexPath.row];
    cell.groupName.text = exercise.name;

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake(collectionView.frame.size.width, 50);

}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/


// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


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
