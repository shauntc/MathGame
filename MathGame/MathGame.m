//
//  MathGame.m
//  MathGame
//
//  Created by Shaun Campbell on 2016-09-12.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import "MathGame.h"

@implementation MathGame

-(NSString *)newQuestion
{
    if(self.currentPlayer >= self.players.count - 1)
    {
        self.currentPlayer = 0;
    }
    else{
        self.currentPlayer+=1;
    }
    
    
    self.currentValue = 0;

    
    int num1 = arc4random_uniform(20)+1;
    int num2 = arc4random_uniform(20)+1;
    int rand = arc4random_uniform(3);
    
    if(rand<=0)
    {
        self.currentAnswer = num1 + num2;
        return [NSString stringWithFormat:@"Player %i: %i + %i ?", (self.currentPlayer +1), num1, num2];
    }
    else if(rand <= 1)
    {
        self.currentAnswer = num1 - num2;
        return [NSString stringWithFormat:@"Player %i: %i - %i ?", (self.currentPlayer +1), num1, num2];
    }
    else
    {
        self.currentAnswer = num1 * num2;
        return [NSString stringWithFormat:@"Player %i: %i x %i ?", (self.currentPlayer +1), num1, num2];
    }
    
}

-(BOOL)checkAnswer
{
    return (self.currentValue == self.currentAnswer);
}


-(int)appendCurrentValueWithValue:(int)value
{
    if(self.currentValue >= 100)
    {
        self.currentValue = self.currentValue - (self.currentValue/100)*100;
    }
    
    self.currentValue = (10*self.currentValue) + value;
   
    return self.currentValue;
}

-(NSString*)currentPlayerStatus
{
    return [NSString stringWithFormat:@"P%i: Pts:%i <3: %i", (self.currentPlayer + 1), [self.players[self.currentPlayer] score], [self.players[self.currentPlayer] lives]];
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _players =@[
                    [[Player alloc] init],
                    [[Player alloc] init]
                    ];
        _currentValue = 0;
        _currentAnswer = 0;
        
        //initializes to last player so that when new question is called it will switch to player 1)
        _currentPlayer =  (int)_players.count - 1;
    }
    return self;
}

@end
