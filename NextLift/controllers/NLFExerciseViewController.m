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
#import "NLFAddExerciseViewController.h"

@interface NLFExerciseViewController ()
@property (nonatomic, strong) NSString *groupName;
@property (nonatomic, strong) NLFDatabase *db;
@property(nonatomic, strong) RLMResults *exercises;
@end

@implementation NLFExerciseViewController

static NSString *const reuseIdentifier = @"NLFCollectionCell";

- (instancetype)initWithName:(NSString *)name {

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];

    if (self = [super initWithCollectionViewLayout:flowLayout]) {
        self.db = [NLFDatabaseFactory getInstance];
        self.groupName = name;
        
        self.exercises = [self.db getAllExercisesForMuscleGroup:self.groupName];
        [self navigationBarInit];
        
        [self.db addConsumer:self];
        
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

#pragma mark - <NLFDatabaseDelegate>

- (void)exerciseAdded
{
    self.exercises = [self.db getAllExercisesForMuscleGroup:self.groupName];
    NSLog(@"here %@", self.exercises);
    
    [self.collectionView reloadData];
}


#pragma mark - internal

- (void)navigationBarInit
{
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Add"
                                                                  style:UIBarButtonItemStylePlain
                                                                 target:self
                                                                 action:@selector(addExercisePopOver)];
    addButton.tintColor = [NLFColor backgroundBlack];

    self.navigationItem.title = self.groupName;

    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)addExercisePopOver
{
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle: nil];
    
    
    NLFAddExerciseViewController *controller = (NLFAddExerciseViewController*)[mainStoryboard
                                                                               instantiateViewControllerWithIdentifier: @"addEX"];
    controller.groupName = self.groupName;

    [self.navigationController presentViewController:controller animated:YES completion:nil];
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
    NSLog(@"%@", exercise.name);
    cell.groupName.text = exercise.name;

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    return CGSizeMake(collectionView.frame.size.width, 50);

}

#pragma mark <UICollectionViewDelegate>

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


@end
