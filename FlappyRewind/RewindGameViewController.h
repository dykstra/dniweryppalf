//
//  RewindGameViewController.h
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/21/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "RewindSettingsViewController.h"

int birdyFlightRewind;
int randomTopObjectRewind;
int randomBottomObjectRewind;
int scoreNumberRewind;
NSInteger lowScoreNumber;

@interface RewindGameViewController : UIViewController

{
    IBOutlet UIImageView *birdyRewind;
    IBOutlet UIImageView *gameOverRewind;
    IBOutlet UIImageView *rewindGameBack;
    IBOutlet UIButton *startGameRewind;
    IBOutlet UIImageView *objectTopRewind;
    IBOutlet UIImageView *objectBottomRewind;
    IBOutlet UIImageView *BarTopR;
    IBOutlet UIImageView *barBottom;
    IBOutlet UIButton *tryAgainRewind;
    IBOutlet UIButton *backRewind;
    IBOutlet UILabel *scoreLabelRewind;
    IBOutlet UIButton *settingsButon;
    
    NSTimer *birdyMoveRewind;
    NSTimer *objectsMovementRewind;
}

-(IBAction)startGameRewindButton:(id)sender;
-(void)birdyMovingRewind;
-(void)objectMovingRewind;
-(void)placeObjectsRewind;
-(void)scoreRewind;
-(void)gameOverRewind;

@end
