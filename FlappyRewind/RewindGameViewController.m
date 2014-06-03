//
//  RewindGameViewController.m
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/21/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import "GameManager.h"
#import "RewindSettingsViewController.h"
#import "RewindGameViewController.h"
#import "HighLowScoreViewController.h"

@interface RewindGameViewController ()

@end

@implementation RewindGameViewController


-(IBAction)startGameRewindButton:(id)sender {
    
    objectTopRewind.hidden = NO;
    objectBottomRewind.hidden = NO;
    startGameRewind.hidden = YES;
    backRewind.hidden = YES;
    gameOverRewind.hidden = YES;
    tryAgainRewind.hidden = YES;
    rewindGameBack.hidden = NO;
    scoreLabelRewind.hidden = NO;
    settingsButon.hidden = YES;
    
//Set bird animation. Lower the Interval to make birdy go up and down faster.
    
    birdyMoveRewind = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(birdyMovingRewind) userInfo:nil repeats:YES];
    [self placeObjectsRewind];
    
//Sets movement speed of objects.
    
    objectsMovementRewind = [NSTimer scheduledTimerWithTimeInterval:-0.025 target:self selector:@selector(objectMovingRewind) userInfo:nil repeats:YES];
}

-(void)gameOverRewind {
    
    if (scoreNumberRewind < lowScoreNumber) {
        [[NSUserDefaults standardUserDefaults] setInteger:scoreNumberRewind forKey:@"LowScoreSaved"];
    }
    
    [objectsMovementRewind invalidate];
    [birdyMoveRewind invalidate];
    
    tryAgainRewind.hidden = NO;
    gameOverRewind.hidden = NO;
    backRewind.hidden = NO;
    objectTopRewind.hidden = YES;
    objectBottomRewind.hidden = YES;
    birdyRewind.hidden = YES;
    rewindGameBack.hidden = NO;
    scoreLabelRewind.hidden = NO;
    settingsButon.hidden = NO;
}

-(void)scoreRewind {
    
    scoreNumberRewind = scoreNumberRewind - 1;
    scoreLabelRewind.text = [NSString stringWithFormat:@"%i", scoreNumberRewind];
}

-(IBAction)tryAgainRewindButton:(id)sender {
    
//Reloads the initial rewind game view after gameover.
    
    RewindGameViewController *rewindGameViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RewindGameViewController"];
    [self presentViewController:rewindGameViewController animated:YES completion:nil];
    
}

-(void)objectMovingRewind {
    
    objectTopRewind.center = CGPointMake(objectTopRewind.center.x +0.13, objectTopRewind.center.y);
    objectBottomRewind.center = CGPointMake(objectBottomRewind.center.x +0.13, objectBottomRewind.center.y);
    
//Once objects reach right of screen, resets the object images to start over on the left.
    
    if (objectTopRewind.center.x > 335){
        [self placeObjectsRewind];
    }
    
//Decrements the score by 1 as successfully flown through objects. I have no idea why == 0 works, as .x of the topobject is 267.
    
    if (objectTopRewind.center.x == 0){
        [self scoreRewind];
    }
    
//Collusion with birdy and objects.
    
    if (CGRectIntersectsRect(birdyRewind.frame, objectTopRewind.frame)){
        [self gameOverRewind];
    }
    
    if (CGRectIntersectsRect(birdyRewind.frame, objectBottomRewind.frame)){
        [self gameOverRewind];
    }
    
    if (CGRectIntersectsRect(birdyRewind.frame, BarTopR.frame)){
        [self gameOverRewind];
    }
    
    if (CGRectIntersectsRect(birdyRewind.frame, barBottom.frame)){
        [self gameOverRewind];
    }
}

//Randomly generates objects in different positions; ensuring proper spacing from top, bottom & middle.

-(void)placeObjectsRewind {
    
    randomTopObjectRewind = arc4random() %330;  //original 350
    randomTopObjectRewind = randomTopObjectRewind - 228; //original 228

//Get's _difficulty value from NSObject GameManager
    
    [GameManager getDifficulty];
    
    if ([GameManager getDifficulty] == 0) {
        
//Adjust for difficulty - 655 is hard. Increase to make it easier.
    
    randomBottomObjectRewind = randomTopObjectRewind + 690;
        objectTopRewind.center = CGPointMake(0, randomTopObjectRewind);
        objectBottomRewind.center = CGPointMake(0, randomBottomObjectRewind);
    
    } else if ([GameManager getDifficulty] == 1) {
        
    randomBottomObjectRewind = randomTopObjectRewind + 670;
        objectTopRewind.center = CGPointMake(0, randomTopObjectRewind);
        objectBottomRewind.center = CGPointMake(0, randomBottomObjectRewind);
    
    } else if ([GameManager getDifficulty] == 2) {
        
        randomBottomObjectRewind = randomTopObjectRewind + 655;
            objectTopRewind.center = CGPointMake(0, randomTopObjectRewind);
            objectBottomRewind.center = CGPointMake(0, randomBottomObjectRewind);
    }
}

-(void)birdyMovingRewind {

//Set user's uiswitch gravity selection from previous settings screen
    
    NSUserDefaults *GravitySwitchValue = [NSUserDefaults standardUserDefaults];
    BOOL SwitchOn = [GravitySwitchValue boolForKey:@"SwitchOn"];

//UISwitch "SwitchOn" to invert gravity. Also sets the position and speed as birdy is tapped.
    
    if (SwitchOn) {
        
        birdyRewind.center = CGPointMake(birdyRewind.center.x, birdyRewind.center.y + birdyFlightRewind);
        birdyFlightRewind = birdyFlightRewind - 5;
        if (birdyFlightRewind < -15) {
            birdyFlightRewind = -15;
        }
    }
    else {
        
        birdyRewind.center = CGPointMake(birdyRewind.center.x, birdyRewind.center.y - birdyFlightRewind);
        birdyFlightRewind = birdyFlightRewind - 5;
        if (birdyFlightRewind < -15) {
            birdyFlightRewind = -15;
        }
    }
    
    if (birdyFlightRewind > 0) {
        birdyRewind.image = [UIImage imageNamed:@"flappyLgUp.png"];
        }
    
    if (birdyFlightRewind < 0) {
        birdyRewind.image = [UIImage imageNamed:@"flappyLgDown.png"];
    }
}

//The jump height of the birdy wen tapped; higher the #, higher up the bird goes.
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    birdyFlightRewind = 30;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    objectTopRewind.hidden = YES;
    objectBottomRewind.hidden = YES;
    tryAgainRewind.hidden = YES;
    gameOverRewind.hidden = YES;
    rewindGameBack.hidden = NO;
    scoreLabelRewind.hidden = YES;
    
    scoreNumberRewind = 0;
    lowScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"LowScoreSaved"];
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end