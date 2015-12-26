//
//  SecondTableViewController.m
//  RestaurantTAD
//
//  Created by Diana on 11/27/15.
//  Copyright (c) 2015 Diana. All rights reserved.
//

#import "SecondTableViewController.h"

@interface SecondTableViewController (){
    
    IBOutlet UITextField *nameField;
    
    IBOutlet UITextField *dateField;
    
    IBOutlet UILabel *tipLabel;
}

@end

@implementation SecondTableViewController

@synthesize tipCount;

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
    nameField.delegate = self;
    dateField.delegate = self;
    AppDelegate *appD = [[UIApplication sharedApplication]
                         delegate];
    NSDictionary *rest = [[appD restaurants] objectAtIndex:[appD chosen]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd, hh:mm"];
    NSDate *date = [rest objectForKey: @"Date"];
    [nameField setText: [rest objectForKey: @"Name"]];
    [dateField setText: [dateFormatter stringFromDate: date]];
    [tipLabel setText: [rest objectForKey: @"Tip"]];
    
    // nameT.keyboardAppearance = UIKeyboardAppearanceDark;
    

    
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

-(void)viewDidDisappear:(BOOL)animated{
    NSString *str = dateField.text;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd, hh:mm"];
    NSDictionary *resultRest = @{@"Name":nameField.text, @"Date":[dateFormatter dateFromString:str], @"Tip": tipLabel.text};
    //[self.delegate secondTableViewController:self didSave:resultRest];
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
    if([segue.identifier isEqualToString:@"TipSegue"]){
        TipTableViewController *ttvc = segue.destinationViewController;
        ttvc.delegate = self;
        ttvc.tip = tipCount;
        
    }
}

-(void)tipTableViewController:(TipTableViewController *)controller didSave:(Tip *)tip{
    Counter *counter = [[Counter alloc] init];
    tipCount = [counter count:tip];
    tipLabel.text = [tipCount stringValue];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}



@end
