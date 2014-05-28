//
//  RewindGameViewController.m
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/21/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import "RewindGameViewController.h"

@interface RewindGameViewController ()

@end

@implementation RewindGameViewController

-(void)GameOverR {
    
    if (ScoreNumberR > LowScoreNumberR) {
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumberR forKey:@"LowScoreSaved"];
    }
    
    [ObjectsMovementR invalidate];
    [BirdyMoveR invalidate];
    
    TryAgainR.hidden = NO;
    GameOverR.hidden = NO;
    BackR.hidden = NO;
    ObjectTopR.hidden = YES;
    ObjectBottomR.hidden = YES;
    BirdyR.hidden = YES;
    RewindGameBack.hidden = NO;
    ScoreLabelR.hidden = NO;
    SettingsButton.hidden = NO;
}

-(void)ScoreR {
    
    ScoreNumberR = ScoreNumberR - 1;
    ScoreLabelR.text = [NSString stringWithFormat:@"%i", ScoreNumberR];
}

-(IBAction)StartGameR:(id)sender {

    ObjectTopR.hidden = NO;
    ObjectBottomR.hidden = NO;
    StartGameR.hidden = YES;
    BackR.hidden = YES;
    GameOverR.hidden = YES;
    TryAgainR.hidden = YES;
    RewindGameBack.hidden = NO;
    ScoreLabelR.hidden = NO;
    SettingsButton.hidden = YES;
    
    BirdyMoveR = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdyMovingR) userInfo:nil repeats:YES];
        [self PlaceObjectsR];

//Sets movement speed of objects.
    
    ObjectsMovementR = [NSTimer scheduledTimerWithTimeInterval:-0.01 target:self selector:@selector(ObjectsMovingR) userInfo:nil repeats:YES];
}

-(void)ObjectsMovingR {
    
    ObjectTopR.center = CGPointMake(ObjectTopR.center.x +0.1, ObjectTopR.center.y);
    ObjectBottomR.center = CGPointMake(ObjectBottomR.center.x +0.1, ObjectBottomR.center.y);
    
//Once objects reach right of screen, resets the object images to start over on the left.
    
    if (ObjectTopR.center.x > 318){
        [self PlaceObjectsR];
    }
    
//Decrements the score by 1 as successfully flown through objects.
    
    if (ObjectTopR.center.x == 288){
        [self ScoreR];
    }
    
//Collusion with birdy and objects.
    
    if (CGRectIntersectsRect(BirdyR.frame, ObjectTopR.frame)){
        [self GameOverR];
    }
    
    if (CGRectIntersectsRect(BirdyR.frame, ObjectBottomR.frame)){
        [self GameOverR];
    }
    
    if (CGRectIntersectsRect(BirdyR.frame, BarTopR.frame)){
        [self GameOverR];
    }
    
    if (CGRectIntersectsRect(BirdyR.frame, BarBottomR.frame)){
        [self GameOverR];
    }
}

//Randomly generates the objects in different positions; ensuring proper spacing from top, bottom and middle.

-(void)PlaceObjectsR {
    
    RandomTopObjectPositionR = arc4random() %350;
    RandomTopObjectPositionR = RandomTopObjectPositionR - 228;
    
//Adjust for difficulty - 655 is hard. Increase to make it easier.
    
    RandomBottomObjectPositionR = RandomTopObjectPositionR + 660;
    
    ObjectTopR.center = CGPointMake(0, RandomTopObjectPositionR);
    ObjectBottomR.center = CGPointMake(0, RandomBottomObjectPositionR);
}

-(void)BirdyMovingR {

//Set user's uiswitch gravity selection from previous settings screen
    
    NSUserDefaults *GravitySwitchValue = [NSUserDefaults standardUserDefaults];
    BOOL SwitchOn = [GravitySwitchValue boolForKey:@"SwitchOn"];

//UISwitch to invert gravity. Also sets the position and speed as birdy is tapped.
    
    if (SwitchOn) {
        
        BirdyR.center = CGPointMake(BirdyR.center.x, BirdyR.center.y + BirdyFlightR);
        BirdyFlightR = BirdyFlightR - 5;
        if (BirdyFlightR < -15) {
            BirdyFlightR = -15;
        }
    }
    else {
        
        BirdyR.center = CGPointMake(BirdyR.center.x, BirdyR.center.y - BirdyFlightR);
        BirdyFlightR = BirdyFlightR - 5;
        if (BirdyFlightR < -15) {
            BirdyFlightR = -15;
        }
    }
    
    if (BirdyFlightR > 0) {
        BirdyR.image = [UIImage imageNamed:@"flappyLgDown.png"];
        }
    if (BirdyFlightR < 0) {
        BirdyR.image = [UIImage imageNamed:@"flappyLgUp.png"];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    BirdyFlightR = 30;
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
    ObjectTopR.hidden = YES;
    ObjectBottomR.hidden = YES;
    TryAgainR.hidden = YES;
    GameOverR.hidden = YES;
    RewindGameBack.hidden = YES;
    ScoreLabelR.hidden = YES;
    SettingsButton.hidden = NO;
    
    ScoreNumberR = 0;
    LowScoreNumberR = [[NSUserDefaults standardUserDefaults] integerForKey:@"LowScoreSaved"];
    
    [super viewDidLoad];
    
    //NSUserDefaults *GravitySwitchValue = [NSUserDefaults standardUserDefaults];
    //BOOL SwitchOn = [GravitySwitchValue boolForKey:@"SwitchOn"];
    
    //_UISwitchInvertGravity.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"switchOn"];
    
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