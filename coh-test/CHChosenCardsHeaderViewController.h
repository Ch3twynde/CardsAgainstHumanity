//
//  CHChosenCardsHeaderViewController.h
//  coh-test
//
//  Created by Miles Alden on 2/14/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHChosenCardsHeaderViewController : UIViewController

@property (strong) UIButton *chooseWinningCards;
@property (strong) UILabel *headerLabel;

- (void)genContent;

@end
