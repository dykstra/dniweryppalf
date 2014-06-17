//
//  GameSettingsViewController.h
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/25/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface GameSettingsViewController : UIViewController <ADBannerViewDelegate>

@property (nonatomic, strong) IBOutlet UISwitch *fastForwardBirdSwitch;
@property (nonatomic, strong) IBOutlet UISwitch *magneticFloorSwitch;
@property (nonatomic, strong) IBOutlet UIButton *easyGameButton;
@property (nonatomic, strong) IBOutlet UIButton *mediumGameButton;
@property (nonatomic, strong) IBOutlet UIButton *hardGameButton;

-(IBAction)switchFastForward;
-(IBAction)switchMagneticFloor;
-(IBAction)easyButton;
-(IBAction)mediumButton;
-(IBAction)hardButton;


@end
