//
//  SecondViewController.h
//  RestaurantTAD
//
//  Created by Diana on 10/30/15.
//  Copyright (c) 2015 Diana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface SecondViewController : UIViewController
{    
    IBOutlet UILabel *label;
    IBOutlet UILabel *dateLabel;
    IBOutlet UILabel *tipLabel;
    IBOutlet UITextField *nameT;
    IBOutlet UITextField *dateT;
    IBOutlet UITextField *tipT;
    IBOutlet UIButton *saveButton;
}
- (IBAction)pressSave:(id)sender;

@end
