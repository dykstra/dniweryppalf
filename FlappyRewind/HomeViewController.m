//
//  HighLowScoreViewController.m
//  FlappyRewind
//
//  Created by Doug Dykstra on 6/2/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
//High score defaults for easy, med, hard.
    highScoreEasy = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScoreEasySaved"];
     highScoreEasyLabel.text = [NSString stringWithFormat:@" %li", (long)highScoreEasy];
    
    highScoreMedium = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScoreMediumSaved"];
     highScoreMediumLabel.text = [NSString stringWithFormat:@" %li", (long)highScoreMedium];
    
    highScoreHard = [[NSUserDefaults standardUserDefaults] integerForKey:@"highScoreHardSaved"];
     highScoreHardLabel.text = [NSString stringWithFormat:@" %li", (long)highScoreHard];
    
//Low score defaults for easy, med, hard.
    lowScoreEasy = [[NSUserDefaults standardUserDefaults] integerForKey:@"lowScoreEasySaved"];
     lowScoreEasyLabel.text = [NSString stringWithFormat:@" %li", (long)lowScoreEasy];
    
    lowScoreMedium = [[NSUserDefaults standardUserDefaults] integerForKey:@"lowScoreMediumSaved"];
     lowScoreMediumLabel.text = [NSString stringWithFormat:@" %li", (long)lowScoreMedium];
    
    lowScoreHard = [[NSUserDefaults standardUserDefaults] integerForKey:@"lowScoreHardSaved"];
     lowScoreHardLabel.text = [NSString stringWithFormat:@" %li", (long)lowScoreHard];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark iAd Delegate Methods

-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
      
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [banner setAlpha:1];
    [UIView commitAnimations];
        
}
-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [banner setAlpha:0];
    [UIView commitAnimations];
    
}

 /*
 //For video / audio suspend when full ad is accessed. @synthesize bannerIsVisible up top, and add this to the .h: ADBannerView *adView;
 BOOL bannerIsVisible;
 
 -(BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
 {
 NSLog(@"Banner view is beginning an ad action");
 BOOL shouldExecuteAction = YES;
 
 if (!willLeave && shouldExecuteAction) {
 // stop all interaction process in the app
 // [video pause]
 // [audio pause]
 }
 return shouldExecuteAction;
 }
 
 -(void)bannerViewActionDidFinish:(ADBannerView *)banner;
 {
 // resume everything you've stopped
 // [video resume]
 // [audio resume]
 }
*/

@end
