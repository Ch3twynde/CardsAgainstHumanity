//
//  ViewController.h
//  cards
//
//  Created by Miles Alden on 12/27/14.
//  Copyright (c) 2014 ensighten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <coh/CardsAgainstHumanity.h>


@interface ViewController : UIViewController

@property (strong) CHWhiteDeck *whiteDeck;
@property (strong) CHBlackDeck *blackDeck;
@property (strong) CHStaticTableHeaderWrapperViewController *chosenVCWrapper;
@property (strong) CHPlayersTableViewController *playersVC;


@end

