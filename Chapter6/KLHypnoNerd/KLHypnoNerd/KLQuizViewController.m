//
//  KLQuizViewController.m
//  Quiz
//
//  Created by Kevin on 15/9/23.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "KLQuizViewController.h"

@interface KLQuizViewController ()
@property (nonatomic, ) NSArray *answers;
@property (nonatomic, strong) NSArray *questions;
@property (nonatomic, assign) NSInteger currentQuestionIndex;

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end

@implementation KLQuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.questions = @[@"From what is cognac made?",
                         @"What is 7+7?",
                         @"What is the capital of Vermont?"];
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
        
        self.tabBarItem.title = @"Quiz";
        self.tabBarItem.image = [UIImage imageNamed:@"Time"];
    }
    return self;
}

- (IBAction)showQuestion:(UIButton *)sender {
    NSString *str1;
    NSLog(@"%@",str1);
    self.currentQuestionIndex++;
    if (self.currentQuestionIndex == [self.questions count]) {
        self.currentQuestionIndex = 0;
    }
    
    NSString *question = self.questions[self.currentQuestionIndex];
    self.questionLabel.text = question;
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender {
    NSString *answer = self.answers[self.currentQuestionIndex];
    self.answerLabel.text = answer;
}

@end
