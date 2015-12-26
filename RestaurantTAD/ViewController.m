//
//  ViewController.m
//  RestaurantTAD
//
//  Created by Diana on 10/29/15.
//  Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"First view loaded");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    AppDelegate *appD = [[UIApplication sharedApplication]
                         delegate];
    return [[appD restaurants] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *strId = @"strID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strId];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strId];
    }
    
    //UIImage *image = [UIImage imageNamed:@"watermelon.jpg"];
    //cell.imageView.image = image;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",
                                 indexPath.row + 1];
    
    AppDelegate *appD = [[UIApplication sharedApplication]
                        delegate];
    NSDictionary *restDict = [[appD restaurants] objectAtIndex:indexPath.row];
    cell.textLabel.text = [restDict objectForKey: @"Name"];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:30];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 0;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    AppDelegate *appD = [[UIApplication sharedApplication]
                         delegate];
    //NSDictionary *restDict = [rests objectAtIndex:indexPath.row];
    appD.chosen = indexPath.row;
    
    //NSString *message = [[NSString alloc] initWithFormat:
                       //  @"Hi!!!"];
    
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Row is selected!" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    //[alert show];
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    //SecondViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier: @"secondView"];
   // [self.navigationController pushViewController:secondView animated:YES];
  //  [self presentViewController:secondView animated:YES completion:nil];
    
    SecondViewController *secondViewCtrl = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    [[self navigationController] pushViewController:secondViewCtrl animated: YES];
   }

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}


@end
