//
//  ViewController.m
//  cards
//
//  Created by Miles Alden on 12/27/14.
//  Copyright (c) 2014 ensighten. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    float navHeight = self.navigationController.navigationBar.frame.size.height;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [button addTarget:self action:@selector(buttonMethod:) forControlEvents:UIControlEventTouchDown];
//    [button setFrame:CGRectMake (0,0+navHeight, 60,44)];
//    [button setBackgroundColor:[UIColor whiteColor]];
//    [button setTitle:@"New Round" forState:UIControlStateNormal];
//    [button setTag:111];
//    [button sizeToFit];
//    [self.view addSubview:button];
//    button.center = CGPointMake(self.view.center.x, self.view.center.y - 44);
//    

    // Start Game
    [[CHGame game] startGame];

    
    // Players VC
    self.playersVCWrapper = [[CHStaticPlayersHeaderWrapperViewController alloc] initWithNavigationController:self.navigationController frame:self.view.frame];

    [self.view addSubview:self.playersVCWrapper.view];

    
    // Chosen Cards Wrapper VC
    self.chosenVCWrapper = [[CHStaticTableHeaderWrapperViewController alloc] init];
    self.chosenVCWrapper.view.frame = CGRectMake(0, self.view.frame.size.height / 2, self.view.frame.size.width, self.view.frame.size.height / 2);
    [self.view addSubview:self.chosenVCWrapper.view];
    
}
- (void)viewDidAppear:(BOOL)animated {
    [self.chosenVCWrapper.chosenVC.tableView reloadData];
}
- (void)buttonMethod:(id)sender {
    [[CHGame game] nextRound];
    [self.chosenVCWrapper.chosenVC.tableView reloadData];
}
- (void)playerButton:(id)sender {
    
    CHPlayerCardsTableViewController* playerCardsVC = [[CHPlayerCardsTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    playerCardsVC.player = [[CHGame game] playerByName:[[sender titleLabel] text]];
    playerCardsVC.title = @"Hand";
    
    [self.navigationController pushViewController:playerCardsVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
