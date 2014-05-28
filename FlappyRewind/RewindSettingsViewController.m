//
//  RewindSettingsViewController.m
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/25/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import "RewindSettingsViewController.h"

@interface RewindSettingsViewController ()

@end

@implementation RewindSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)SwitchGravity {

//UISwitch to invert gravity. Saves the selected setting which is retrieved in the Rewind Game VC.
    
    NSUserDefaults *GravitySwitchValue = [NSUserDefaults standardUserDefaults];
    [GravitySwitchValue setBool:self.UISwitchInvertGravity.on forKey:@"SwitchOn"];
    [GravitySwitchValue synchronize];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _UISwitchInvertGravity.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"SwitchOn"];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
