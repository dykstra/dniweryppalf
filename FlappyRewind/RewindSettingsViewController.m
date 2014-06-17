//
//  RewindSettingsViewController.m
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/25/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import "GameManager.h"
#import "HomeViewController.h"
#import "RewindGameViewController.h"
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

-(IBAction)SpeedUpObjects {
    
//UISwitch to invert gravity. Saves the selected setting which is retrieved in the Rewind Game VC.
    
    NSUserDefaults *speedUpObjectsValue = [NSUserDefaults standardUserDefaults];
    [speedUpObjectsValue setBool:self.UISwitchSpeedUpObjects.on forKey:@"speedUpObjectsSwitchOn"];
    [speedUpObjectsValue synchronize];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

//Sets the default user selected invert gravity selection on load.
    
    _UISwitchInvertGravity.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"SwitchOn"];
    
    _UISwitchSpeedUpObjects.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"speedUpObjectsSwitchOn"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Easy(0), Medium(1), and Hard(2) buttons

-(IBAction)easyMode {
    [GameManager setDifficulty:0];
    //lowScoreEasy = [[NSUserDefaults standardUserDefaults] integerForKey:@"lowScoreEasySaved"];
}

-(IBAction)mediumMode {
    [GameManager setDifficulty:1];
    //lowScoreMedium = [[NSUserDefaults standardUserDefaults] integerForKey:@"lowScoreMediumSaved"];
}

-(IBAction)hardMode {
    [GameManager setDifficulty:2];
    //lowScoreHard = [[NSUserDefaults standardUserDefaults] integerForKey:@"lowScoreHardSaved"];
}

//iAd

#pragma mark iAd Delegate Methods

-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [banner setAlpha:1];
    [UIView commitAnimations];
    
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [banner setAlpha:0];
    [UIView commitAnimations];
    
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
