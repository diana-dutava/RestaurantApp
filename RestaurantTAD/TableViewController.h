//
//  TableViewController.h
//  RestaurantTAD
//
//  Created by Diana on 11/26/15.
//  Copyright (c) 2015 Diana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondTableViewController.h"
#import "AppDelegate.h"
#import "TableViewCell.h"
#import "AddingTableViewController.h"


@interface TableViewController : UITableViewController <AddingTableViewControllerDelegate, SecondTableViewControllerDelegate>

@end
