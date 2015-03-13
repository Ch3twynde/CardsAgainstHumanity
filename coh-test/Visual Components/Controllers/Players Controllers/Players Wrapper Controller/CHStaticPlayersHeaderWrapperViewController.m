//
//  CHStaticPlayersHeaderWrapperViewController.m
//  coh-test
//
//  Created by Miles Alden on 2/17/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import "CHStaticPlayersHeaderWrapperViewController.h"
#import "CHGame.h"

@interface CHStaticPlayersHeaderWrapperViewController ()

@end

@implementation CHStaticPlayersHeaderWrapperViewController

- (id)initWithNavigationController:(UINavigationController *)nav frame:(CGRect)frame {

    if ( self = [super init] ) {
        
        self.fixedHeaderController = [[CHPlayersHeaderViewController alloc] init];
        self.chosenVC = [[CHPlayersTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
        self.chosenVC.parentNavController = nav;
        self.view.frame = frame;
        
        float headerHeight = 50;
        float navHeight = nav.navigationBar.frame.size.height + nav.navigationBar.frame.origin.y;
        CGRect f = CGRectMake(0, navHeight, frame.size.width, headerHeight);
        self.fixedHeaderController.view.frame = f;
    
        float y = self.fixedHeaderController.view.frame.origin.y + self.fixedHeaderController.view.frame.size.height;
        float h = y + frame.size.height / 2;
        CGSize s = CGSizeMake(self.view.frame.size.width, h);
        self.chosenVC.view.frame = CGRectMake(0, y, self.view.frame.size.width, h - navHeight);
        
        [self setup];
    }
    
    
    
    return self;
}

- (void)setup {
    
    [self.fixedHeaderController genContent];
    [self.view addSubview:self.fixedHeaderController.view];
    
    // Chosen Cards VC
    [self.view addSubview:self.chosenVC.view];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


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
