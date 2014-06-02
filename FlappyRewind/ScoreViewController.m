//
//  ScoreViewController.m
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/17/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()

@end

@implementation ScoreViewController

- (void)viewDidLoad
{
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    HighScore.text = [NSString stringWithFormat:@" %li", (long)HighScoreNumber];
    
    LowScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"LowScoreSaved"];
    LowScore.text = [NSString stringWithFormat:@" %li", (long)LowScoreNumber];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
