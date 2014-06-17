//
//  GameViewController.m
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/17/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import "GameViewController.h"
#import "GameManager.h"
#import "GameSettingsViewController.h"
#import "HomeViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController


-(IBAction)startGame:(id)sender {
    
objectSpeed = 1;
    
//Set user's uiswitch fast forward selection from previous settings screen
    
    NSUserDefaults *fastForwardSwitchValue = [NSUserDefaults standardUserDefaults];
    BOOL fastForwardSwitchOn = [fastForwardSwitchValue boolForKey:@"fastForwardSwitchOn"];
    
    objectTop.hidden = NO;
    objectBottom.hidden = NO;
    backWhiteObjectTop.hidden = NO;
    backWhiteObjectBottom.hidden = NO;
    startGame.hidden = YES;
    home.hidden = YES;
    GameOver.hidden = YES;
    settingsButton.hidden = YES;
    scoreLabel.hidden = NO;
    
//Set bird animation. Lower the Interval to make birdy go up and down faster; 0.03 is good fast speed.
    
    if (fastForwardSwitchOn) {
        birdyMove = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(birdyMoving) userInfo:nil repeats:YES];
    }
    else {
        birdyMove = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(birdyMoving) userInfo:nil repeats:YES];
    }
    
    [self placeObjects];
    
//Sets movement speed of objects.
    
    objectsMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(objectsMoving) userInfo:nil repeats:YES];
    
}

-(void)gameOver {
    
    [GameManager getDifficulty];

//Verifies / checks game difficulty and saves the best score.
    
    if ([GameManager getDifficulty] == 0 & scoreEasy > highScoreEasy) {
        [[NSUserDefaults standardUserDefaults] setInteger:scoreEasy forKey:@"highScoreEasySaved"];
    }
      
    else if ([GameManager getDifficulty] == 1 & scoreMedium > highScoreMedium) {
        [[NSUserDefaults standardUserDefaults] setInteger:scoreMedium forKey:@"highScoreMediumSaved"];
    }
    
    else if ([GameManager getDifficulty] == 2 & scoreHard > highScoreHard) {
        [[NSUserDefaults standardUserDefaults] setInteger:scoreHard forKey:@"highScoreHardSaved"];
    }
    
    [objectsMovement invalidate];
    [birdyMove invalidate];
    
    GameOver.hidden = NO;
    tryAgain.hidden = NO;
    settingsButton.hidden = NO;
    home.hidden = NO;
    objectTop.hidden = YES;
    objectBottom.hidden = YES;
    backWhiteObjectTop.hidden = YES;
    backWhiteObjectBottom.hidden = YES;
    birdy.hidden = YES;
    
}

//Scoring; easy, med, hard.

-(void)scoreEasy {
    
    scoreEasy = scoreEasy + 1;
    scoreLabel.text = [NSString stringWithFormat:@"%i", scoreEasy];
}

-(void)scoreMedium {
    
   scoreMedium = scoreMedium + 1;
    scoreLabel.text = [NSString stringWithFormat:@"%i", scoreMedium];
}

-(void)scoreHard {
    
    scoreHard = scoreHard + 1;
    scoreLabel.text = [NSString stringWithFormat:@"%i", scoreHard];
}

-(IBAction)tryAgainButton:(id)sender {
    
//Reloads the initial game view after gameover.
    
    GameViewController *gameViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"GameViewController"];
    [self presentViewController:gameViewController animated:YES completion:nil];
    
}

-(void)objectsMoving {
    
    objectTop.center = CGPointMake(objectTop.center.x -objectSpeed, objectTop.center.y);
        backWhiteObjectTop.center = CGPointMake(backWhiteObjectTop.center.x-objectSpeed, backWhiteObjectTop.center.y);
    objectBottom.center = CGPointMake(objectBottom.center.x -objectSpeed, objectBottom.center.y);
        backWhiteObjectBottom.center = CGPointMake(backWhiteObjectBottom.center.x-objectSpeed, backWhiteObjectBottom.center.y);
    
//Resets the object images to start over on the right of the screen.
    if (objectTop.center.x < -52) {
        [self placeObjects];
    }
    
    if (backWhiteObjectTop.center.x < -52) {
        [self placeObjects];
    }
    
//Increments the score by 1 as successfully flown through objects and sends it to the leaderboard.
    
//    if (ObjectTop.center.x == 8){
//        [self scoreEasy];
//    }
//    
//    if (ObjectTop.center.x == 8){
//        [self scoreMedium];
//    }
//    
//    if (ObjectTop.center.x == 8){
//        [self scoreHard];
//    }
    
    if ((birdy.frame.origin.x > (objectTop.frame.origin.x + objectTop.frame.size.width)) && (birdy.frame.origin.x < (objectTop.frame.origin.x + objectTop.frame.size.width + objectSpeed))) {
        
        switch ([GameManager getDifficulty]) {
            case 0:
            {
                [self scoreEasy];
                break;
            }
                
            case 1:
            {
                [self scoreMedium];
                break;
            }
                
            case 2:
            {
                [self scoreHard];
                break;
            }
                
            default:
            {
                [self scoreEasy];
                break;
            }
        }
    }
    
//Collusion with birdy and objects.
    if (CGRectIntersectsRect(birdy.frame, objectTop.frame)){
        [self gameOver];
    }
    
    if (CGRectIntersectsRect(birdy.frame, objectBottom.frame)){
        [self gameOver];
    }
    
    if (CGRectIntersectsRect(birdy.frame, barTop.frame)){
        [self gameOver];
    }
    
    if (CGRectIntersectsRect(birdy.frame, barBottom.frame)){
        [self gameOver];
    }
}


//Randomly generates the objects in different positions; ensuring proper spacing from top, bottom and middle.

-(void)placeObjects {

//Switched to support 3.5" iPhone.
    int pos = self.view.bounds.size.height / 1.8;
    
    randomTopObjectPosition = arc4random() % pos;
    randomTopObjectPosition = randomTopObjectPosition - 228;
    
    //RandomTopObjectPosition = arc4random() %350;  //original 350
    //RandomTopObjectPosition = RandomTopObjectPosition - 228; //orignal 228
    
//Get's _difficulty value from NSObject GameManager
    
    [GameManager getDifficulty];

//Easy-0
    if ([GameManager getDifficulty] == 0) {
        
//Adjust for difficulty - 655 is hard. Increase to make it easier.
        randomBottomObjectPosition = randomTopObjectPosition + 675;
            objectTop.center = CGPointMake(340, randomTopObjectPosition);
            backWhiteObjectTop.center = CGPointMake(340, randomTopObjectPosition);
            objectBottom.center = CGPointMake(340, randomBottomObjectPosition);
            backWhiteObjectBottom.center = CGPointMake(340, randomBottomObjectPosition);
        
            objectSpeed = 1.3;

    }

//Medium-1
    else if ([GameManager getDifficulty] == 1) {
        
            randomBottomObjectPosition = randomTopObjectPosition + 665;
            objectTop.center = CGPointMake(340, randomTopObjectPosition);
            backWhiteObjectTop.center = CGPointMake(340, randomTopObjectPosition);
            objectBottom.center = CGPointMake(340, randomBottomObjectPosition);
            backWhiteObjectBottom.center = CGPointMake(340, randomBottomObjectPosition);
        
            objectSpeed = 1.3;
        
        }

//Hard-2
    else if ([GameManager getDifficulty] == 2) {
    
        if (scoreHard < 2)  {
            
            randomBottomObjectPosition = randomTopObjectPosition + 690;
            objectTop.center = CGPointMake(340, randomTopObjectPosition);
            backWhiteObjectTop.center = CGPointMake(340, randomTopObjectPosition);
            objectBottom.center = CGPointMake(340, randomBottomObjectPosition);
            backWhiteObjectBottom.center = CGPointMake(340, randomBottomObjectPosition);
            
            objectSpeed = 1.5;
            
        }
    
        else if (scoreHard < 5)  {
            
            randomBottomObjectPosition = randomTopObjectPosition + 670;
            objectTop.center = CGPointMake(340, randomTopObjectPosition);
            backWhiteObjectTop.center = CGPointMake(340, randomTopObjectPosition);
            objectBottom.center = CGPointMake(340, randomBottomObjectPosition);
            backWhiteObjectBottom.center = CGPointMake(340, randomBottomObjectPosition);
            
            objectSpeed = 2;
            
        }
        else {
            
            randomBottomObjectPosition = randomTopObjectPosition + 665;
            objectTop.center = CGPointMake(340, randomTopObjectPosition);
            backWhiteObjectTop.center = CGPointMake(340, randomTopObjectPosition);
            objectBottom.center = CGPointMake(340, randomBottomObjectPosition);
            backWhiteObjectBottom.center = CGPointMake(340, randomBottomObjectPosition);
            
            objectSpeed = 2.75;
        }
    }
}

//Sets the position and speed as birdy is tapped.
-(void)birdyMoving {

//NSUserDefaults for magnetic floor
    NSUserDefaults *magneticFloorSwitchValue = [NSUserDefaults standardUserDefaults];
    BOOL magneticFloorSwitchOn = [magneticFloorSwitchValue boolForKey:@"magneticFloorSwitchOn"];
    
    birdy.center = CGPointMake(birdy.center.x, birdy.center.y - birdyFlight);

//The higher the #, the quicker the fall.  UISwitch for magnetic floor.
    
    if (magneticFloorSwitchOn){
        birdyFlight = birdyFlight -13;
    }
    else{
    birdyFlight = birdyFlight - 5;
    }
    
//Birdy drop speed
    if (birdyFlight < -15) {
        birdyFlight = -15;
    }
    
    if (birdyFlight > 0) {
        birdy.image = [UIImage imageNamed:@"flappyLargeUp.png"];
    }
    
    if (birdyFlight < 0) {
        birdy.image = [UIImage imageNamed:@"flappyLargeDown.png"];
    }
}

//The jump height of the birdy when tapped; higher the #, higher up the bird goes.
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    birdyFlight = 30;
    
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
    
    objectTop.hidden = YES;
    objectBottom.hidden = YES;
    backWhiteObjectTop.hidden = YES;
    backWhiteObjectBottom.hidden = YES;
    GameOver.hidden = YES;
    tryAgain.hidden = YES;
    scoreLabel.hidden = YES;
    
    scoreEasy = 0;
    highScoreEasy = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScoreEasySaved"];
    
    scoreMedium = 0;
    highScoreMedium = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScoreMediumSaved"];
    
    scoreHard = 0;
    highScoreHard = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScoreHardSaved"];
    
//Animation for top and bottom objects
    objectBottom.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"objectyellowbottom.png"],
                                    [UIImage imageNamed:@"objectyellowbottom1.png"], nil];
    [objectBottom setAnimationRepeatCount:0];
    objectBottom.animationDuration = 0.1;
    [objectBottom startAnimating];
    
    objectTop.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"objectyellowtop.png"],
                                    [UIImage imageNamed:@"objectyellowtop1.png"], nil];
    [objectTop setAnimationRepeatCount:0];
    objectTop.animationDuration = 0.1;
    [objectTop startAnimating];
    
//Animation for top and bottom back objects
    backWhiteObjectBottom.animationImages = [NSArray arrayWithObjects:
                                    [UIImage imageNamed:@"objectgreenbottom.png"],
                                    [UIImage imageNamed:@"backobjectyellow.png"], nil];
    [backWhiteObjectBottom setAnimationRepeatCount:0];
    backWhiteObjectBottom.animationDuration = 0.1;
    [backWhiteObjectBottom startAnimating];
    
    backWhiteObjectTop.animationImages = [NSArray arrayWithObjects:
                                 [UIImage imageNamed:@"objectgreenbottom.png"],
                                 [UIImage imageNamed:@"backobjectyellow.png"], nil];
    [backWhiteObjectTop setAnimationRepeatCount:0];
    backWhiteObjectTop.animationDuration = 0.1;
    [backWhiteObjectTop startAnimating];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    {
        NSString *flappyRewind = [[NSBundle mainBundle]pathForResource:@"flappyRewind" ofType:@"wav"];
        technoJam = [[AVAudioPlayer alloc] initWithContentsOfURL: [NSURL fileURLWithPath:flappyRewind] error:NULL];
        technoJam.delegate = self;
        technoJam.numberOfLoops=-1;
        [technoJam play];
    }
}

//Kills the music
- (void)viewWillDisappear:(BOOL)animated{
    
    [technoJam stop]; ///(my players name here and command to stop the player)
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
