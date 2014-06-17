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
#import "HomeViewController.h"

@interface RewindGameViewController ()

@end

@implementation RewindGameViewController

-(IBAction)startGameRewindButton:(id)sender {
 
objectSpeedRewindDefault = 0.03;
objectSpeedRewindFast = 0.04;
    
    objectTopRewind.hidden = NO;
    objectBottomRewind.hidden = NO;
    backWhiteObjectTopRewind.hidden = NO;
    backWhiteObjectBottomRewind.hidden = NO;
    startGameRewind.hidden = YES;
    backRewind.hidden = YES;
    gameOverRewind.hidden = YES;
    tryAgainRewind.hidden = YES;
    rewindGameBack.hidden = NO;
    scoreRewindLabel.hidden = NO;
    settingsButon.hidden = YES;
    
//Set bird animation. Lower the Interval to make birdy go up and down faster; 0.03 is good fast speed.
    
    birdyMoveRewind = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(birdyMovingRewind) userInfo:nil repeats:YES];
    [self placeObjectsRewind];
    
//Sets movement speed of objects.
    
    objectsMovementRewind = [NSTimer scheduledTimerWithTimeInterval:-0.01 target:self selector:@selector(objectMovingRewind) userInfo:nil repeats:YES];
}

-(void)gameOverRewind {
    
    [GameManager getDifficulty];

//Verifies / checks game difficulty and saves the best score.
    if ([GameManager getDifficulty] == 0 & scoreEasyRewind < lowScoreEasy) {
        [[NSUserDefaults standardUserDefaults] setInteger:scoreEasyRewind forKey:@"lowScoreEasySaved"];
    }
    
    else if ([GameManager getDifficulty] == 1 & scoreMediumRewind < lowScoreMedium) {
        [[NSUserDefaults standardUserDefaults] setInteger:scoreMediumRewind forKey:@"lowScoreMediumSaved"];
    }
    
    else if ([GameManager getDifficulty] == 2 & scoreHardRewind < lowScoreHard) {
        [[NSUserDefaults standardUserDefaults] setInteger:scoreHardRewind forKey:@"lowScoreHardSaved"];
    }
    
    [objectsMovementRewind invalidate];
    [birdyMoveRewind invalidate];
    
    tryAgainRewind.hidden = NO;
    gameOverRewind.hidden = NO;
    backRewind.hidden = NO;
    objectTopRewind.hidden = YES;
    objectBottomRewind.hidden = YES;
    backWhiteObjectBottomRewind.hidden = YES;
    backWhiteObjectTopRewind.hidden = YES;
    birdyRewind.hidden = YES;
    rewindGameBack.hidden = NO;
    scoreRewindLabel.hidden = NO;
    settingsButon.hidden = NO;
}

//Scoring; easy, med, hard.
-(void)scoreEasyRewind {
    
    scoreEasyRewind = scoreEasyRewind - 1;
    scoreRewindLabel.text = [NSString stringWithFormat:@"%i", scoreEasyRewind];
}

-(void)scoreMediumRewind {
    
    scoreMediumRewind = scoreMediumRewind - 1;
    scoreRewindLabel.text = [NSString stringWithFormat:@"%i", scoreMediumRewind];
}

-(void)scoreHardRewind {
    
    scoreHardRewind = scoreHardRewind - 1;
    scoreRewindLabel.text = [NSString stringWithFormat:@"%i", scoreHardRewind];
}

-(IBAction)tryAgainRewindButton:(id)sender {
    
//Reloads the initial rewind game view after gameover.
    
    RewindGameViewController *rewindGameViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RewindGameViewController"];
    [self presentViewController:rewindGameViewController animated:YES completion:nil];
    
}

-(void)objectMovingRewind {
    
    objectSpeedRewindDefault = 0.03;
    objectSpeedRewindFast = 0.04;
    
    NSUserDefaults *speedUpObjectsValue = [NSUserDefaults standardUserDefaults];
    BOOL speedUpObjectsSwitchOn = [speedUpObjectsValue boolForKey:@"speedUpObjectsSwitchOn"];
    
    if (speedUpObjectsSwitchOn) {
        objectTopRewind.center = CGPointMake(objectTopRewind.center.x + objectSpeedRewindFast, objectTopRewind.center.y);//0.05
        backWhiteObjectTopRewind.center = CGPointMake(backWhiteObjectTopRewind.center.x +objectSpeedRewindFast, backWhiteObjectTopRewind.center.y);
        objectBottomRewind.center = CGPointMake(objectBottomRewind.center.x +objectSpeedRewindFast, objectBottomRewind.center.y);
        backWhiteObjectBottomRewind.center = CGPointMake(backWhiteObjectBottomRewind.center.x +objectSpeedRewindFast, backWhiteObjectBottomRewind.center.y);
    }
    else {
    
        objectTopRewind.center = CGPointMake(objectTopRewind.center.x +objectSpeedRewindDefault, objectTopRewind.center.y);//0.02
        backWhiteObjectTopRewind.center = CGPointMake(backWhiteObjectTopRewind.center.x +objectSpeedRewindDefault, backWhiteObjectTopRewind.center.y);
        objectBottomRewind.center = CGPointMake(objectBottomRewind.center.x +objectSpeedRewindDefault, objectBottomRewind.center.y);
        backWhiteObjectBottomRewind.center = CGPointMake(backWhiteObjectBottomRewind.center.x +objectSpeedRewindDefault, backWhiteObjectBottomRewind.center.y);
}

    //Once objects reach right of screen, resets the object images to start over on the left.
    
    if (objectTopRewind.center.x > 350){ //335
        [self placeObjectsRewind];
    }
    
    if (backWhiteObjectTopRewind.center.x > 350) { //335
        [self placeObjectsRewind];
    }
    
//Decrements the score by 1 as successfully flown through objects. I have no idea why == 0 works, as .x of the topobject is 267.

    
/*
    if (objectTopRewind.center.x == 0){
        [self scoreEasyRewind];
    }
    
    if (objectTopRewind.center.x == 0){
        [self scoreMediumRewind];
    }
    
    if (objectTopRewind.center.x == 0){

        [self scoreHardRewind];
    }
*/

    if ((birdyRewind.frame.origin.x < (objectTopRewind.frame.origin.x - objectTopRewind.frame.size.width)) && (birdyRewind.frame.origin.x > (objectTopRewind.frame.origin.x - objectTopRewind.frame.size.width - objectSpeedRewindDefault))) {
        
        switch ([GameManager getDifficulty]) {
            case 0:
            {
                [self scoreEasyRewind];
                break;
            }
                
            case 1:
            {
                [self scoreMediumRewind];
                break;
            }
                
            case 2:
            {
                [self scoreHardRewind];
                break;
            }
                
            default:
            {
                [self scoreEasyRewind];
                break;
            }
        }
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

//Switched to support 3.5" iPhone.
int pos = self.view.bounds.size.height / 1.8;
    
    randomTopObjectRewind = arc4random() % pos;  //original 350%
    randomTopObjectRewind = randomTopObjectRewind - 228; //original 228

//Get's _difficulty value from NSObject GameManager
    
    [GameManager getDifficulty];
//Easy
    if ([GameManager getDifficulty] == 0) {
        
//Adjust for difficulty - 655 is hard. Increase to make it easier.
    
    randomBottomObjectRewind = randomTopObjectRewind + 680; //690
        objectTopRewind.center = CGPointMake(0, randomTopObjectRewind);
        backWhiteObjectTopRewind.center = CGPointMake(0, randomTopObjectRewind);
        objectBottomRewind.center = CGPointMake(0, randomBottomObjectRewind);
        backWhiteObjectBottomRewind.center = CGPointMake(0, randomBottomObjectRewind);

//Medium
    } else if ([GameManager getDifficulty] == 1) {
        
    randomBottomObjectRewind = randomTopObjectRewind + 665; //670
        objectTopRewind.center = CGPointMake(0, randomTopObjectRewind);
        backWhiteObjectTopRewind.center = CGPointMake(0, randomTopObjectRewind);
        objectBottomRewind.center = CGPointMake(0, randomBottomObjectRewind);
        backWhiteObjectBottomRewind.center = CGPointMake(0, randomBottomObjectRewind);

//Hard-2
    }else if ([GameManager getDifficulty] == 2) {
            
            if (scoreHardRewind > -2)  {
                
                randomBottomObjectRewind = randomTopObjectRewind + 690;
                objectTopRewind.center = CGPointMake(0, randomTopObjectRewind);
                backWhiteObjectTopRewind.center = CGPointMake(0, randomTopObjectRewind);
                objectBottomRewind.center = CGPointMake(0, randomBottomObjectRewind);
                backWhiteObjectBottomRewind.center = CGPointMake(0, randomBottomObjectRewind);
                
            }
            else if (scoreHardRewind > -5)  {
                
                randomBottomObjectRewind = randomTopObjectRewind + 665;
                objectTopRewind.center = CGPointMake(0, randomTopObjectRewind);
                backWhiteObjectTopRewind.center = CGPointMake(0, randomTopObjectRewind);
                objectBottomRewind.center = CGPointMake(0, randomBottomObjectRewind);
                backWhiteObjectBottomRewind.center = CGPointMake(0, randomBottomObjectRewind);
                
            }
            else {
                
                randomBottomObjectRewind = randomTopObjectRewind + 655;
                objectTopRewind.center = CGPointMake(0, randomTopObjectRewind);
                backWhiteObjectTopRewind.center = CGPointMake(0, randomTopObjectRewind);
                objectBottomRewind.center = CGPointMake(0, randomBottomObjectRewind);
                backWhiteObjectBottomRewind.center = CGPointMake(0, randomBottomObjectRewind);
               
            }
        }
    }
        
-(void)birdyMovingRewind {

//Set user's uiswitch gravity selection from previous settings screen
    
    NSUserDefaults *GravitySwitchValue = [NSUserDefaults standardUserDefaults];
    BOOL SwitchOn = [GravitySwitchValue boolForKey:@"SwitchOn"];

//UISwitch "SwitchOn" to invert gravity. Also sets the position and speed as birdy is tapped.
    
    if (SwitchOn) {
        
        birdyRewind.center = CGPointMake(birdyRewind.center.x, birdyRewind.center.y + birdyFlightRewind);

//The higher the #, the quicker the fall (add a uiswitch for magnetic bottom? 13 is a good #)
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
        birdyRewind.image = [UIImage imageNamed:@"flappyLargeUp.png"];
        }
    
    if (birdyFlightRewind < 0) {
        birdyRewind.image = [UIImage imageNamed:@"flappyLargeDown.png"];
    }
}

//The jump height of the birdy when tapped; higher the #, higher up the bird goes.
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
    backWhiteObjectTopRewind.hidden = YES;
    backWhiteObjectBottomRewind.hidden = YES;
    tryAgainRewind.hidden = YES;
    gameOverRewind.hidden = YES;
    rewindGameBack.hidden = NO;
    scoreRewindLabel.hidden = YES;

    scoreEasyRewind = 0;
    lowScoreEasy = [[NSUserDefaults standardUserDefaults] integerForKey:@"lowScoreEasySaved"];
    
    scoreMediumRewind = 0;
    lowScoreMedium = [[NSUserDefaults standardUserDefaults] integerForKey:@"lowScoreMediumSaved"];
    
    scoreHardRewind = 0;
    lowScoreHard = [[NSUserDefaults standardUserDefaults] integerForKey:@"lowScoreHardSaved"];
    
//Animation for top and bottom objects
    objectBottomRewind.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"objectgreenbottom.png"],
                                    [UIImage imageNamed:@"objectgreenbottom1.png"], nil];
    [objectBottomRewind setAnimationRepeatCount:0];
    objectBottomRewind.animationDuration = 0.1;
    [objectBottomRewind startAnimating];
    
    objectTopRewind.animationImages = [NSArray arrayWithObjects:
                                 [UIImage imageNamed:@"objectgreentop.png"],
                                 [UIImage imageNamed:@"objectgreentop1.png"], nil];
    [objectTopRewind setAnimationRepeatCount:0];
    objectTopRewind.animationDuration = 0.1;
    [objectTopRewind startAnimating];
    
//Animation for top and bottom back objects
    backWhiteObjectBottomRewind.animationImages = [NSArray arrayWithObjects:
                                             [UIImage imageNamed:@"objectyellowbottom.png"],
                                             [UIImage imageNamed:@"backobjectyellow.png"], nil];
    [backWhiteObjectBottomRewind setAnimationRepeatCount:0];
    backWhiteObjectBottomRewind.animationDuration = 0.1;
    [backWhiteObjectBottomRewind startAnimating];
    
    backWhiteObjectTopRewind.animationImages = [NSArray arrayWithObjects:
                                          [UIImage imageNamed:@"objectyellowbottom.png"],
                                          [UIImage imageNamed:@"backobjectyellow.png"], nil];
    [backWhiteObjectTopRewind setAnimationRepeatCount:0];
    backWhiteObjectTopRewind.animationDuration = 0.1;
    [backWhiteObjectTopRewind startAnimating];
    
    [super viewDidLoad];

//Plays background music
    {
        NSString *flappyRewind = [[NSBundle mainBundle]pathForResource:@"flappyRewind" ofType:@"wav"];
        technoJam = [[AVAudioPlayer alloc] initWithContentsOfURL: [NSURL fileURLWithPath:flappyRewind] error:NULL];
        technoJam.delegate = self;
        technoJam.numberOfLoops=-1;
        [technoJam play];
    }

    // Do any additional setup after loading the view.
}

//Kills the music
- (void)viewWillDisappear:(BOOL)animated{
    
    [technoJam stop]; //stop the music
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