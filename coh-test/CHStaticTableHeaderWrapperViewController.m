//
//  CHStaticTableHeaderWrapperViewController.m
//  coh-test
//
//  Created by Miles Alden on 2/14/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import "CHStaticTableHeaderWrapperViewController.h"
#import "CHGame.h"

@interface CHStaticTableHeaderWrapperViewController ()

@end

@implementation CHStaticTableHeaderWrapperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.fixedHeaderController = [[CHChosenCardsHeaderViewController alloc] init];
    [self.fixedHeaderController genContent];
    
    [self.view addSubview:self.fixedHeaderController.view];
    self.fixedHeaderController.headerLabel.text = [[[[CHGame game] currentRound] blackCard] message];
//    [self.fixedHeaderController.headerLabel sizeToFit];
    
    
    // Chosen Cards VC
    self.chosenVC = [[CHChosenCardsTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.view addSubview:self.chosenVC.view];
    CGFloat height = self.fixedHeaderController.headerLabel.frame.size.height;
    self.chosenVC.view.frame = CGRectMake(0, height, self.view.frame.size.width, self.view.frame.size.height - height);
    
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
