//
//  Player.m
//  MathGame
//
//  Created by Shaun Campbell on 2016-09-12.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import "Player.h"

@implementation Player


-(BOOL)loseLife
{
    self.lives -= 1;
    
    if(self.lives <= 0)
    {
        return NO;
    }
    else{
        return YES;
    }
}

-(int)increaseScore
{
    self.score += 1;
    return self.score;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _lives = 3;
        _score = 0;
    }
    return self;
}


@end
