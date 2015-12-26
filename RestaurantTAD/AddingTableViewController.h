//
//  AddingTableViewController.h
//  RestaurantTAD
//
//  Created by Diana on 11/27/15.
//  Copyright (c) 2015 Diana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TipTableViewController.h"
#import "Counter.h"

@class AddingTableViewController;

@protocol AddingTableViewControllerDelegate <NSObject>

-(void)addingTableViewControllerDidCancel:
(AddingTableViewController *)controller;
-(void)addingTableViewControllerDidSave:
(AddingTableViewController *)controller:(NSDictionary *)restaurant;

@end

@interface AddingTableViewController : UITableViewController <UITextFieldDelegate, TipTableViewControllerDelegate>

@property(nonatomic, weak) id <AddingTableViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

//@property (strong, nonatomic) IBOutlet UITextField *dateTextField;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;
@property NSNumber *tipCount;

- (IBAction)done:(id)sender;
- (IBAction)cancel:(id)sender;

@end
