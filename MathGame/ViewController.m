//
//  ViewController.m
//  MathGame
//
//  Created by Shaun Campbell on 2016-09-12.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

#import "ViewController.h"
#import "MathGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *player1ScoreAndLives;
@property (weak, nonatomic) IBOutlet UILabel *player2ScoreAndLives;
@property (weak, nonatomic) IBOutlet UILabel *currentQuestion;
@property (weak, nonatomic) IBOutlet UILabel *currentValue;
@property (weak, nonatomic) IBOutlet UILabel *rightWrongLabel;

@property (nonatomic) MathGame *game;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.game = [[MathGame alloc] init];
    
    self.player1ScoreAndLives.text = @"P1: Pts:0 <3: 3";
    self.player2ScoreAndLives.text = @"P2: Pts:0 <3: 3";
    self.currentValue.text = @"";
    self.currentQuestion.text = [self.game newQuestion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//Keypad
- (IBAction)oneButton:(UIButton *)sender {
    self.currentValue.text = [NSString stringWithFormat:@"%i",[self.game appendCurrentValueWithValue:1]];
}
- (IBAction)twoButton:(UIButton *)sender {
    self.currentValue.text = [NSString stringWithFormat:@"%i",[self.game appendCurrentValueWithValue:2]];
}
- (IBAction)threeButton:(UIButton *)sender {
    self.currentValue.text = [NSString stringWithFormat:@"%i",[self.game appendCurrentValueWithValue:3]];
}
- (IBAction)fourButton:(UIButton *)sender {
    self.currentValue.text = [NSString stringWithFormat:@"%i",[self.game appendCurrentValueWithValue:4]];
}
///changed five and six
- (IBAction)fiveButton:(UIButton *)sender {
    self.currentValue.text = [NSString stringWithFormat:@"%i",[self.game appendCurrentValueWithValue:5]];
}
- (IBAction)sixButton:(UIButton *)sender {
    self.currentValue.text = [NSString stringWithFormat:@"%i",[self.game appendCurrentValueWithValue:6]];
}
- (IBAction)sevenButton:(UIButton *)sender {
    self.currentValue.text = [NSString stringWithFormat:@"%i",[self.game appendCurrentValueWithValue:7]];
}
- (IBAction)eightButton:(UIButton *)sender {
    self.currentValue.text = [NSString stringWithFormat:@"%i",[self.game appendCurrentValueWithValue:8]];
}
- (IBAction)nineButton:(UIButton *)sender {
    self.currentValue.text = [NSString stringWithFormat:@"%i",[self.game appendCurrentValueWithValue:9]];
}
- (IBAction)zeroButton:(UIButton *)sender {
    self.currentValue.text = [NSString stringWithFormat:@"%i",[self.game appendCurrentValueWithValue:0]];
}



//Enter button function
- (IBAction)enterButton:(UIButton *)sender {
    
    if([self.game checkAnswer])
    {
        [self.game.players[self.game.currentPlayer] increaseScore];
        [self flashCorrect];
        
    }
    else{
        
        [self flashIncorrect];
        
        if(![self.game.players[self.game.currentPlayer] loseLife])
        {
            [self showGameover];
        }
    }
    
    
    
    [self setupNextTurn];
    
    
}


-(void)setupNextTurn {
    
    if(self.game.currentPlayer)
    {
        self.player2ScoreAndLives.text = [self.game currentPlayerStatus];
    }
    else{
        self.player1ScoreAndLives.text = [self.game currentPlayerStatus];
    }
    
    
    self.currentQuestion.text = [self.game newQuestion];
    self.currentValue.text = @"";
}




-(void)showGameover {
    
    
    UIAlertController *restartAlert = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"Player %i Lost", (self.game.currentPlayer+1)] message:@"Press restart to play again" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *restart = [UIAlertAction actionWithTitle:@"Restart" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Log UI Alert Action taking place");
    }];
    
    [restartAlert addAction:restart];
    
    // show the alert contorller
    
    [self presentViewController:restartAlert animated:YES completion:nil];
    
    
    [self resetGameStatus];

    
}

-(void)resetGameStatus
{
    self.game = [[MathGame alloc] init];
    self.player1ScoreAndLives.text = @"P1: Pts:0 <3: 3";
    self.player2ScoreAndLives.text = @"P2: Pts:0 <3: 3";
    self.currentValue.text = @"";
}

-(void)flashCorrect
{
    self.rightWrongLabel.text = @"Correct";
    self.rightWrongLabel.textColor = [UIColor greenColor];
    self.rightWrongLabel.alpha = 100;
    
    
    [UIView animateWithDuration:1 animations:^{self.rightWrongLabel.alpha=0;}];

    
    
}

-(void)flashIncorrect
{
    self.rightWrongLabel.text = @"Wrong";
    self.rightWrongLabel.textColor = [UIColor redColor];
    self.rightWrongLabel.alpha = 100;
    
    [UIView animateWithDuration:1 animations:^{self.rightWrongLabel.alpha=0;}];
    
}


@end
