//
//  AddingTableViewController.m
//  RestaurantTAD
//
//  Created by Diana on 11/27/15.
//  Copyright (c) 2015 Diana. All rights reserved.
//

#import "AddingTableViewController.h"

@interface AddingTableViewController ()

@end

@implementation AddingTableViewController

@synthesize delegate;
@synthesize tipCount;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        tipCount = @0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.nameTextField.delegate = self;
    self.detailLabel.text = [tipCount stringValue];
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


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        [self.nameTextField becomeFirstResponder];
    }
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
    self.detailLabel.text = [tipCount stringValue];
    //[self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)done:(id)sender {
    NSString *restName = self.nameTextField.text;
    NSDate *restDate = [self.datePicker date];
    NSDictionary *rest = @{@"Name":restName, @"Date":restDate, @"Tip": [tipCount stringValue]};
    [self.delegate addingTableViewControllerDidSave:self: rest];
}

- (IBAction)cancel:(id)sender {
    [self.delegate addingTableViewControllerDidCancel:self];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.nameTextField resignFirstResponder];
   // [self.view endEditing:YES];
}

@end
