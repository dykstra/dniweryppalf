//
//  GameViewController.h
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/17/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#include "GameSettingsViewController.h"

int birdyFlight;
int randomTopObjectPosition;
int randomBottomObjectPosition;
int scoreEasy;
int scoreMedium;
int scoreHard;
float objectSpeed;

@interface GameViewController : UIViewController <AVAudioPlayerDelegate>
{    
    AVAudioPlayer *technoJam;
    
    IBOutlet UIImageView *birdy;
    IBOutlet UIImageView *GameOver;
    IBOutlet UIButton *startGame;
    IBOutlet UIImageView *objectTop;
    IBOutlet UIImageView *backWhiteObjectTop;
    IBOutlet UIImageView *objectBottom;
    IBOutlet UIImageView *backWhiteObjectBottom;
    IBOutlet UIImageView *barTop;
    IBOutlet UIImageView *barBottom;
    IBOutlet UIButton *home;
    IBOutlet UILabel *scoreLabel;
    IBOutlet UIButton *tryAgain;
    IBOutlet UIButton *settingsButton;
    
    NSTimer *birdyMove;
    NSTimer *objectsMovement;
    
}

-(IBAction)startGame:(id)sender;
-(IBAction)tryAgainButton:(id)sender;
-(void)birdyMoving;
-(void)objectsMoving;
-(void)placeObjects;
-(void)scoreEasy;
-(void)scoreMedium;
-(void)scoreHard;
-(void)gameOver;

@end
