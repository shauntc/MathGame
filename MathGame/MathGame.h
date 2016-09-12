//
//  MathGame.h
//  MathGame
//
//  Created by Shaun Campbell on 2016-09-12.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Player.h"

@interface MathGame : NSObject

@property (nonatomic) NSArray *players;
@property (nonatomic) int currentValue;
@property (nonatomic) int currentAnswer;
@property (nonatomic) int currentPlayer;

-(NSString *)newQuestion;
-(int)appendCurrentValueWithValue:(int)value;
-(BOOL)checkAnswer;
-(NSString*)currentPlayerStatus;



@end
