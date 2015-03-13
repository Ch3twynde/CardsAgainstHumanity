//
//  CHChosenCardsHeaderViewController.m
//  coh-test
//
//  Created by Miles Alden on 2/14/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import "CHChosenCardsHeaderViewController.h"

@interface CHChosenCardsHeaderViewController ()

@end

@implementation CHChosenCardsHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    
}
- (void)genContent {
    
    CGPoint pt = self.view.frame.origin;
    CGSize s = self.view.frame.size;
    CGRect r = CGRectMake(pt.x, pt.y, s.width, 50);

    self.headerLabel = [[UILabel alloc] initWithFrame:r];
    self.headerLabel.font = [UIFont fontWithName:@".HelveticaNeueInterface-Regular" size:13.0];
    self.headerLabel.textColor = [UIColor colorWithRed:0.427451 green:0.427451 blue:0.447059 alpha:1];
    self.headerLabel.numberOfLines = 5;
    self.headerLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.headerLabel];
    
    self.chooseWinningCards = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.chooseWinningCards addTarget:self action:@selector(chooseWinner:) forControlEvents:UIControlEventTouchDown];
    [self.chooseWinningCards setBackgroundColor:[UIColor clearColor]];
    [self.chooseWinningCards setTitle:@"Choose Winner" forState:UIControlStateNormal];
    [self.chooseWinningCards setTag:111];
    
//    self.chooseWinningCards.frame = r;
    [self.chooseWinningCards sizeToFit];
    self.chooseWinningCards.titleLabel.textAlignment = NSTextAlignmentRight;


    CGFloat buttonHeight = self.chooseWinningCards.frame.size.height;
    CGFloat buttonWidth = self.chooseWinningCards.frame.size.width;

    CGPoint buttonOrigin = CGPointMake(s.width - buttonWidth , pt.y + r.size.height - buttonHeight);
    CGRect r2 = CGRectMake(buttonOrigin.x, buttonOrigin.y, buttonWidth, buttonHeight);
    
    self.chooseWinningCards.frame = r2;
    [self.view addSubview:self.chooseWinningCards];
    
}

- (void)chooseWinner:(id)sender {
    NSLog(@"Choose winner : %@", sender);
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
