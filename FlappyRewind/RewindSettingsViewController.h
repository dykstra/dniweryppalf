//
//  RewindSettingsViewController.h
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/25/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RewindSettingsViewController : UIViewController

@property (nonatomic, strong) IBOutlet UISlider *DifficultySlider;
@property (nonatomic, strong) IBOutlet UISwitch *UISwitchInvertGravity;

-(IBAction)SwitchGravity;
-(IBAction)AdjustDifficulty;

@end
