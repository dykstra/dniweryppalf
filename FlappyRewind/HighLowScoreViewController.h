//
//  HighLowScoreViewController.h
//  FlappyRewind
//
//  Created by Doug Dykstra on 6/2/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import <UIKit/UIKit.h>

NSInteger HighScoreNumber;
NSInteger lowScoreNumber;

@interface HighLowScoreViewController : UIViewController

{
    IBOutlet UILabel *HighScore;
    IBOutlet UILabel *LowScore;
}

@end
