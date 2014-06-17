//
//  RewindGameViewController.h
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/21/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#include "RewindSettingsViewController.h"

int birdyFlightRewind;
int randomTopObjectRewind;
int randomBottomObjectRewind;
int scoreEasyRewind;
int scoreMediumRewind;
int scoreHardRewind;
float objectSpeedRewindDefault;
float objectSpeedRewindFast;

@interface RewindGameViewController : UIViewController <AVAudioPlayerDelegate>

{
    
    AVAudioPlayer *technoJam;
    
    IBOutlet UIImageView *birdyRewind;
    IBOutlet UIImageView *gameOverRewind;
    IBOutlet UIImageView *rewindGameBack;
    IBOutlet UIButton *startGameRewind;
    IBOutlet UIImageView *objectTopRewind;
    IBOutlet UIImageView *backWhiteObjectTopRewind;
    IBOutlet UIImageView *objectBottomRewind;
    IBOutlet UIImageView *backWhiteObjectBottomRewind;
    IBOutlet UIImageView *BarTopR;
    IBOutlet UIImageView *barBottom;
    IBOutlet UIButton *tryAgainRewind;
    IBOutlet UIButton *backRewind;
    
    IBOutlet UILabel *scoreRewindLabel;
    IBOutlet UIButton *settingsButon;
    
    NSTimer *birdyMoveRewind;
    NSTimer *objectsMovementRewind;
}

-(IBAction)startGameRewindButton:(id)sender;
-(IBAction)tryAgainRewindButton:(id)sender;
-(void)birdyMovingRewind;
-(void)objectMovingRewind;
-(void)placeObjectsRewind;
-(void)scoreEasyRewind;
-(void)scoreMediumRewind;
-(void)scoreHardRewind;
-(void)gameOverRewind;

@end
