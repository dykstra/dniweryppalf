//
//  HighLowScoreViewController.m
//  FlappyRewind
//
//  Created by Doug Dykstra on 6/2/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import "HighLowScoreViewController.h"

@interface HighLowScoreViewController ()

@end

@implementation HighLowScoreViewController

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
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    HighScore.text = [NSString stringWithFormat:@" %li", (long)HighScoreNumber];
    
    lowScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"LowScoreSaved"];
    LowScore.text = [NSString stringWithFormat:@" %li", (long)lowScoreNumber];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
