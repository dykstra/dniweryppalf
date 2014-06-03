//
//  GameViewController.h
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/17/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "GameSettingsViewController.h"

int BirdyFlight;
int RandomTopObjectPosition;
int RandomBottomObjectPosition;
int ScoreNumber;
NSInteger HighScoreNumber;

@interface GameViewController : UIViewController
{
    
    IBOutlet UIImageView *Birdy;
    IBOutlet UIImageView *GameOver;
    IBOutlet UIButton *StartGame;
    IBOutlet UIImageView *ObjectTop;
    IBOutlet UIImageView *ObjectBottom;
    IBOutlet UIImageView *BarTop;
    IBOutlet UIImageView *BarBottom;
    IBOutlet UIButton *TryAgain;
    IBOutlet UIButton *Back;
    IBOutlet UILabel *ScoreLabel;
    
    NSTimer *BirdyMove;
    NSTimer *ObjectsMovement;
    
}

-(IBAction)StartGame:(id)sender;
-(void)BirdyMoving;
-(void)ObjectsMoving;
-(void)PlaceObjects;
-(void)Score;
-(void)GameOver;

@end
