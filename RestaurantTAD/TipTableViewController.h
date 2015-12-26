//
//  TipTableViewController.h
//  RestaurantTAD
//
//  Created by Diana on 11/27/15.
//  Copyright (c) 2015 Diana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tip.h"

@class TipTableViewController;

@protocol TipTableViewControllerDelegate <NSObject>

-(void)tipTableViewController:
(TipTableViewController *)controller
                     didSave:(Tip *)tip;


@end

@interface TipTableViewController : UITableViewController <UITextFieldDelegate>
@property (nonatomic, weak) id <TipTableViewControllerDelegate> delegate;
@property (nonatomic, weak) Tip *tip;
@end
