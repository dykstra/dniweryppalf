//
//  GameManager.m
//  FlappyRewind
//
//  Created by Doug Dykstra on 5/29/14.
//  Copyright (c) 2014 dougdykstra. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager

static int _difficulty;

+(void)setDifficulty:(int)difficulty {
    _difficulty = difficulty;
}

+(int)getDifficulty {
    return _difficulty;
}

@end
