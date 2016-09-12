//
//  Player.h
//  MathGame
//
//  Created by Shaun Campbell on 2016-09-12.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, assign) int lives;
@property (nonatomic, assign) int score;

-(BOOL)loseLife;
-(int)increaseScore;

@end
