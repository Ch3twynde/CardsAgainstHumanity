//
//  CHPlayersHeaderViewController.m
//  coh-test
//
//  Created by Miles Alden on 2/17/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import "CHPlayersHeaderViewController.h"
#import "CHGame.h"

@interface CHPlayersHeaderViewController ()

@end

@implementation CHPlayersHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)genContent {
    
    CGPoint pt = self.view.frame.origin;
    CGSize s = self.view.frame.size;
    CGRect r = CGRectMake(pt.x, pt.y, s.width, 50);
    
    self.nextRound = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.nextRound addTarget:self action:@selector(nextRound:) forControlEvents:UIControlEventTouchDown];
    [self.nextRound setBackgroundColor:[UIColor clearColor]];
    [self.nextRound setTitle:@"New Round" forState:UIControlStateNormal];
    [self.nextRound setTag:222];
    
    //    self.chooseWinningCards.frame = r;
    [self.nextRound sizeToFit];
    self.nextRound.titleLabel.textAlignment = NSTextAlignmentRight;
    
    
    CGFloat buttonHeight = self.nextRound.frame.size.height;
    CGFloat buttonWidth = self.nextRound.frame.size.width;
    
    CGPoint buttonOrigin = CGPointMake(s.width - buttonWidth , pt.y);// + r.size.height - buttonHeight);
    CGRect r2 = CGRectMake(buttonOrigin.x, 0, buttonWidth, buttonHeight);
    
    self.nextRound.frame = r2;
    [self.view addSubview:self.nextRound];
    
}

- (void)nextRound:(id)sender {
    
    [[CHGame game] nextRound];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
