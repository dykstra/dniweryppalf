//
//  HighScoreViewController.h
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/17/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import <UIKit/UIKit.h>

NSInteger HighScoreNumber;
NSInteger LowScoreNumber;

@interface ScoreViewController : UIViewController

{
    IBOutlet UILabel *HighScore;
    IBOutlet UILabel *LowScore;
}

@end
