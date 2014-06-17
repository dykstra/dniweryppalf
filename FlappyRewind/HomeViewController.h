//
//  HighLowScoreViewController.h
//  FlappyRewind
//
//  Created by Doug Dykstra on 6/2/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

NSInteger highScoreEasy;
NSInteger highScoreMedium;
NSInteger highScoreHard;

NSInteger lowScoreEasy;
NSInteger lowScoreMedium;
NSInteger lowScoreHard;

@interface HomeViewController : UIViewController <ADBannerViewDelegate>

{
    
    IBOutlet UILabel *highScoreEasyLabel;
    IBOutlet UILabel *highScoreMediumLabel;
    IBOutlet UILabel *highScoreHardLabel;
    
    IBOutlet UILabel *lowScoreEasyLabel;
    IBOutlet UILabel *lowScoreMediumLabel;
    IBOutlet UILabel *lowScoreHardLabel;
}

@property (nonatomic, assign) BOOL bannerIsVisible;

@end
