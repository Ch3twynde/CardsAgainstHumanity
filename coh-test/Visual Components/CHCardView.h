//
//  CHCardView.h
//  coh-test
//
//  Created by Miles Alden on 1/23/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHCard.h"
#import "CHDeck.h"

@interface CHCardView : UIView

@property (strong) CHCard *card;
@property (strong) CHDeck *deck;
@property (strong) IBOutlet UILabel *body;

@end
