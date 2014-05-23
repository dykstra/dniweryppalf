//
//  GameViewController.m
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/17/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

-(void)GameOver {
    
    if (ScoreNumber > HighScoreNumber) {
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }
    
    [ObjectsMovement invalidate];
    [BirdyMove invalidate];
    
    GameOver.hidden = NO;
    TryAgain.hidden = NO;
    Back.hidden = NO;
    ObjectTop.hidden = YES;
    ObjectBottom.hidden = YES;
    Birdy.hidden = YES;
    
}

-(void)Score {
    
    ScoreNumber = ScoreNumber + 1;
    ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
    
}

-(IBAction)StartGame:(id)sender {
    
    ObjectTop.hidden = NO;
    ObjectBottom.hidden = NO;
    StartGame.hidden = YES;
    Back.hidden = YES;
    GameOver.hidden = YES;
    
    BirdyMove = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdyMoving) userInfo:nil repeats:YES];
    
    [self PlaceObjects];
    
//Sets movement speed of objects.
    
    ObjectsMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(ObjectsMoving) userInfo:nil repeats:YES];
    
}

-(void)ObjectsMoving {
    
    ObjectTop.center = CGPointMake(ObjectTop.center.x -1, ObjectTop.center.y);
    ObjectBottom.center = CGPointMake(ObjectBottom.center.x -1, ObjectBottom.center.y);
    
//Resets the object images to start over on the right of the screen.
    if (ObjectTop.center.x < -52) {
        [self PlaceObjects];
    }
    
//Increments the score by 1 as successfully flown through objects.
    if (ObjectTop.center.x == 8){
        [self Score];
    }
    
//Collusion with birdy and objects.
    if (CGRectIntersectsRect(Birdy.frame, ObjectTop.frame)){
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Birdy.frame, ObjectBottom.frame)){
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Birdy.frame, BarTop.frame)){
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Birdy.frame, BarBottom.frame)){
        [self GameOver];
    }
    
}

//Randomly generates the objects in different positions; ensuring proper spacing from top, bottom and middle.

-(void)PlaceObjects {
    
    RandomTopObjectPosition = arc4random() %350;
    RandomTopObjectPosition = RandomTopObjectPosition - 228;
    
//Adjust for difficulty - 655 is hard. Increase to make it easier.
    RandomBottomObjectPosition = RandomTopObjectPosition + 660;
    
    ObjectTop.center = CGPointMake(340, RandomTopObjectPosition);
    ObjectBottom.center = CGPointMake(340, RandomBottomObjectPosition);
    
}

//Sets the position and speed as birdy is tapped.
-(void)BirdyMoving {
    
    Birdy.center = CGPointMake(Birdy.center.x, Birdy.center.y - BirdyFlight);
    BirdyFlight = BirdyFlight - 5;
    
//Birdy drop speed
    if (BirdyFlight < -15) {
        BirdyFlight = -15;
    }
    
    if (BirdyFlight > 0) {
        Birdy.image = [UIImage imageNamed:@"flappyLgUp.png"];
    }
    
    if (BirdyFlight < 0) {
        Birdy.image = [UIImage imageNamed:@"flappyLgDown.png"];
    }
    
}

//Speed of the Birdy.
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    BirdyFlight = 30;
    
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
    
    ObjectTop.hidden = YES;
    ObjectBottom.hidden = YES;
    GameOver.hidden = YES;
    TryAgain.hidden = YES;
    
    ScoreNumber = 0;
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
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
