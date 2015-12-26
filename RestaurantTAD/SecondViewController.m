//
//  SecondViewController.m
//  RestaurantTAD
//
//  Created by Diana on 10/30/15.
//  Copyright (c) 2015 Diana. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [label setBackgroundColor:[UIColor orangeColor]];
    AppDelegate *appD = [[UIApplication sharedApplication]
                         delegate];
    NSDictionary *rest = [[appD restaurants] objectAtIndex:[appD chosen]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd, hh:mm"];
    NSDate *date = [rest objectForKey: @"Date"];
    [label setText: [rest objectForKey: @"Name"]];
    [dateLabel setText: [dateFormatter stringFromDate: date]];
    [tipLabel setText: [rest objectForKey: @"Tip"]];

   // nameT.keyboardAppearance = UIKeyboardAppearanceDark;
  
    [nameT setText: [rest objectForKey: @"Name"]];
    [dateT setText: [dateFormatter stringFromDate: date]];
    [tipT setText: [rest objectForKey: @"Tip"]];
    
    // Do any additional setup after loading the view.
    NSLog(@"Second view loaded %d",[appD chosen]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressSave:(id)sender {
    AppDelegate *appD = [[UIApplication sharedApplication]
                         delegate];
    NSDictionary *resultRest = @{@"Name":[nameT text], @"Date":[dateT text],
                                 @"Tip":[tipT text]};
    [appD.restaurants replaceObjectAtIndex:appD.chosen withObject:resultRest];
}

/*- (IBAction)pressEdit:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Edit" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: @"Save", nil];
    UITextField *nameText, *dateText  =  [[UITextField alloc] init];
    nameText.tag = 100;
    [nameText setBackgroundColor: [UIColor whiteColor]];
    nameText.delegate = self;
    nameText.borderStyle = UITextBorderStyleLine;
    nameText.frame = CGRectMake(0, 0, 255, 25);
    nameText.placeholder = @"Name";
    nameText.keyboardAppearance = UIKeyboardAppearanceAlert;
    dateText.tag = 101;
    [dateText setBackgroundColor: [UIColor whiteColor]];
    dateText.delegate = self;
    dateText.borderStyle = UITextBorderStyleLine;
    dateText.frame = CGRectMake(0, 90, 255, 25);
    dateText.placeholder = @"Date";
    dateText.keyboardAppearance = UIKeyboardAppearanceDefault;
    NSArray *fields = [NSArray arrayWithObjects: nameText, dateText, nil];
    for(UITextField* textField in fields){
        float i = 0;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, i*30, 255, 25)];
        [view addSubview: textField];
        NSString *str = [NSString stringWithFormat:@"accessoryView%f", i];
        [alert setValue:view forKey:str];
        i++;
    }
    
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==1){
        UIView *view  = [alertView valueForKey:@"accessoryView0"];
        NSString *nameStr = [(UITextField *)[view viewWithTag:100] text];
      //  NSString *dateStr = [(UITextField *)[view viewWithTag:101] text];
        
    }
}
 */


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
