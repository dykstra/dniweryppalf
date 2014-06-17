//
//  GameSettingsViewController.m
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/25/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import "GameManager.h"
#import "HomeViewController.h"
#import "GameSettingsViewController.h"

@interface GameSettingsViewController ()

@end

@implementation GameSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//Fast Forward switch method
-(IBAction)switchFastForward {
    
    //UISwitch to fast forward birdy. Saves the selected setting which is retrieved in the Game VC.
    
    NSUserDefaults *fastForwardSwitchValue = [NSUserDefaults standardUserDefaults];
    [fastForwardSwitchValue setBool:self.fastForwardBirdSwitch.on forKey:@"fastForwardSwitchOn"];
    [fastForwardSwitchValue synchronize];
    
}

//Magnetic floor switch method
-(IBAction)switchMagneticFloor {
    
    //UISwitch to turn on magnetic floor.
    
    NSUserDefaults *magneticFloorSwitchValue = [NSUserDefaults standardUserDefaults];
    [magneticFloorSwitchValue setBool:self.magneticFloorSwitch.on forKey:@"magneticFloorSwitchOn"];
    [magneticFloorSwitchValue synchronize];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//Sets the default user selected fast forward / magnetic floor selection on load.
    
    _fastForwardBirdSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"fastForwardSwitchOn"];
    _magneticFloorSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"magneticFloorSwitchOn"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Easy(0), Medium(1), and Hard(2) buttons

-(IBAction)easyButton {
    [GameManager setDifficulty:0];
    //highScoreEasy = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScoreEasySaved"];
}

-(IBAction)mediumButton {
    [GameManager setDifficulty:1];
    //highScoreMedium = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScoreMediumSaved"];
}

-(IBAction)hardButton {
    [GameManager setDifficulty:2];
    //highScoreHard = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScoreHardSaved"];
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
