//
//  TableViewController.m
//  RestaurantTAD
//
//  Created by Diana on 11/26/15.
//  Copyright (c) 2015 Diana. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    AppDelegate *appD = [[UIApplication sharedApplication]
                         delegate];
    return [[appD restaurants] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *strId = @"MyCell";
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:strId];

    AppDelegate *appD = [[UIApplication sharedApplication]
                         delegate];
    NSDictionary *restDict = [[appD restaurants] objectAtIndex:indexPath.row];

    cell.titleLabel.text = [restDict objectForKey: @"Name"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    NSDate *date = [restDict objectForKey: @"Date"];
    cell.subtitleLabel.textColor = [UIColor lightGrayColor];
    cell.subtitleLabel.text = [dateFormatter stringFromDate: date];
    //cell.editingStyle = UITableViewCellEditingStyleDelete;
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        AppDelegate *appD = [[UIApplication sharedApplication]
                             delegate];
        [[appD restaurants] removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"AddVisit"]){
        UINavigationController *navC = segue.destinationViewController;
        AddingTableViewController *atvc = [[navC viewControllers]
                                           objectAtIndex:0];
        atvc.delegate = self;
    }
  //  else if([segue.identifier isEqualToString:@"LookSegue"]){
    //    UINavigationController *navC = segue.destinationViewController;
      // SecondTableViewController *stvc = [[navC viewControllers]
                                          // objectAtIndex:0];
        //stvc.delegate = self;
    //}
}

#pragma mark - AddingTableViewControllerDelegate

-(void)addingTableViewControllerDidCancel:(AddingTableViewController *)controller{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)addingTableViewControllerDidSave:(AddingTableViewController *)controller:(NSDictionary *)restaurant{
    
    AppDelegate *appD = [[UIApplication sharedApplication]
                         delegate];
    [[appD restaurants] addObject:restaurant];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:appD.restaurants.count-1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)secondTableViewControllerDidSave:(SecondTableViewController *)controller:(NSDictionary *)restaurant{
    
    AppDelegate *appD = [[UIApplication sharedApplication]
                         delegate];
    [[appD restaurants] setObject:restaurant atIndexedSubscript:[appD chosen]];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:appD.chosen inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
