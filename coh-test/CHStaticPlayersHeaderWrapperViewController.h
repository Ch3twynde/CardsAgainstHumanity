//
//  CHStaticPlayersHeaderWrapperViewController.h
//  coh-test
//
//  Created by Miles Alden on 2/17/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHStaticTableHeaderWrapperViewController.h"
#import "CHPlayersTableViewController.h"
#import "CHPlayersHeaderViewController.h"

@interface CHStaticPlayersHeaderWrapperViewController : UIViewController

@property (strong) CHPlayersHeaderViewController *fixedHeaderController;
@property (strong) CHPlayersTableViewController *chosenVC;

- (id)initWithNavigationController:(UINavigationController *)nav frame:(CGRect)frame;

@end
