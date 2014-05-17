//
//  GameViewController.h
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/17/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdyFlight;
int RandomTopObjectPosition;
int RandomBottomObjectPosition;
int ScoreNumber;
NSInteger HighScoreNumber;

@interface GameViewController : UIViewController
{
    
    IBOutlet UIImageView *Birdy;
    IBOutlet UIButton *StartGame;
    IBOutlet UIImageView *ObjectTop;
    IBOutlet UIImageView *ObjectBottom;
    IBOutlet UIImageView *BarTop;
    IBOutlet UIImageView *BarBottom;
    IBOutlet UIButton *Exit;
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
