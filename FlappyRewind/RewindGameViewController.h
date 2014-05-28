//
//  RewindGameViewController.h
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/21/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "RewindSettingsViewController.h"

int BirdyFlightR;
int RandomTopObjectPositionR;
int RandomBottomObjectPositionR;
int ScoreNumberR;
NSInteger LowScoreNumberR;

@interface RewindGameViewController : UIViewController

{
    IBOutlet UIImageView *BirdyR;
    IBOutlet UIImageView *GameOverR;
    IBOutlet UIImageView *RewindGameBack;
    IBOutlet UIButton *StartGameR;
    IBOutlet UIImageView *ObjectTopR;
    IBOutlet UIImageView *ObjectBottomR;
    IBOutlet UIImageView *BarTopR;
    IBOutlet UIImageView *BarBottomR;
    IBOutlet UIButton *TryAgainR;
    IBOutlet UIButton *BackR;
    IBOutlet UILabel *ScoreLabelR;
    IBOutlet UIButton *SettingsButton;
    
    NSTimer *BirdyMoveR;
    NSTimer *ObjectsMovementR;
}

-(IBAction)StartGameR:(id)sender;
-(void)BirdyMovingR;
-(void)ObjectsMovingR;
-(void)PlaceObjectsR;
-(void)ScoreR;
-(void)GameOverR;

@end
