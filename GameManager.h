//
//  GameManager.h
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/29/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameManager : NSObject

@property int difficulty;

+(void) setDifficulty:(int)difficulty;
+(int) getDifficulty;

@end
