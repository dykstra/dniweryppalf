//
//  GameSettingsViewController.h
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/25/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameSettingsViewController : UIViewController

@property (nonatomic, strong) IBOutlet UISwitch *fastForwardBirdSwitch;
@property (nonatomic, strong) IBOutlet UIButton *easyGameButton;
@property (nonatomic, strong) IBOutlet UIButton *mediumGameButton;
@property (nonatomic, strong) IBOutlet UIButton *hardGameButton;

-(IBAction)switchFastForward;
-(IBAction)easyButton;
-(IBAction)mediumButton;
-(IBAction)hardButton;


@end
