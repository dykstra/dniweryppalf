//
//  RewindSettingsViewController.h
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/25/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface RewindSettingsViewController : UIViewController <ADBannerViewDelegate>

@property (nonatomic, strong) IBOutlet UISwitch *UISwitchInvertGravity;
@property (nonatomic, strong) IBOutlet UISwitch *UISwitchSpeedUpObjects;
@property (nonatomic, strong) IBOutlet UIButton *easyModeButton;
@property (nonatomic, strong) IBOutlet UIButton *mediumModeButton;
@property (nonatomic, strong) IBOutlet UIButton *hardModeButton;

-(IBAction)SwitchGravity;
-(IBAction)SpeedUpObjects;
-(IBAction)easyMode;
-(IBAction)mediumMode;
-(IBAction)hardMode;

@end
