//
//  ExercisesViewController.m
//  NextLift
//
//  Created by Dai Williams on 17/09/2015.
//  Copyright © 2015 daio. All rights reserved.
//

#import "ExercisesViewController.h"
#import "NLFDatabaseFactory.h"
#import "NLFColor.h"
#import "MuscleGroupCell.h"

@interface ExercisesViewController ()
@property(nonatomic, strong) NLFDatabase *db;
@property(nonatomic, strong) RLMResults *exercises;
@property (nonatomic, strong) NSString *exerciseName;
@end

static NSString *cellIdentifier = @"exercise";

@implementation ExercisesViewController

- (instancetype)initWithTitle:(NSString *)title {
    if (self = [super init]) {
        self.exerciseNavBar.title = title;
        self.exerciseName = title;
        self.db = [NLFDatabaseFactory getInstance];
        [self.db addConsumer:self];
        self.exercises = [self.db getAllExercisesForMuscleGroup:self.exerciseName];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[NLFMuscleGroup class] forCellReuseIdentifier:cellIdentifier];
    self.tableView.backgroundColor = [NLFColor backgroundBlack];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.exercises.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NLFExercise *exercise = [self.exercises objectAtIndex:(NSUInteger) indexPath.row];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CategoryTableCell" owner:self options:nil];
    MuscleGroupCell *cell = nib[0];
    
    cell.groupName.text = exercise.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NLFExercise *exercise = [self.exercises objectAtIndex:(NSUInteger) indexPath.row];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"Clicked: %@", exercise.name);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}

#pragma mark - <NLFDatabaseDelegate>

- (void)exerciseAdded {
    self.exercises = [self.db getAllExercisesForMuscleGroup:self.exerciseName];
    [self.tableView reloadData];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
