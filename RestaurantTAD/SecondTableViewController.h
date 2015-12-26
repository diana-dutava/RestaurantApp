//
//  SecondTableViewController.h
//  RestaurantTAD
//
//  Created by Diana on 11/27/15.
//  Copyright (c) 2015 Diana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "TipTableViewController.h"
#import "Counter.h"

@class SecondTableViewController;

@protocol SecondTableViewControllerDelegate <NSObject>

-(void)secondTableViewController:
(SecondTableViewController *)controller
                      didSave:(NSDictionary *)dictionary;


@end

@interface SecondTableViewController : UITableViewController <TipTableViewControllerDelegate, UITextFieldDelegate>

@property(nonatomic, weak) id <SecondTableViewControllerDelegate> delegate;
@property NSNumber *tipCount;

@end
