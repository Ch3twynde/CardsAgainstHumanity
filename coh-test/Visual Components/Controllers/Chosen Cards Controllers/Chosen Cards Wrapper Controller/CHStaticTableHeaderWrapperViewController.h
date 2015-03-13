//
//  CHStaticTableHeaderWrapperViewController.h
//  coh-test
//
//  Created by Miles Alden on 2/14/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHChosenCardsHeaderViewController.h"
#import "CHChosenCardsTableViewController.h"

@interface CHStaticTableHeaderWrapperViewController : UIViewController

@property (strong) CHChosenCardsHeaderViewController *fixedHeaderController;
@property (strong) CHChosenCardsTableViewController *chosenVC;
@end
