//
//  CHCardView.m
//  coh-test
//
//  Created by Miles Alden on 1/23/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import "CHCardView.h"

@implementation CHCardView

@synthesize card;

- (CHCard *)card {
    return card;
}
- (void)setCard:(CHCard *)newCard {
    
    if ( newCard.class == NSClassFromString(@"CHBlackCard") ) {
        self.backgroundColor = [UIColor blackColor];
        self.body.textColor = [UIColor whiteColor];
    } else {
        self.backgroundColor = [UIColor whiteColor];
        self.body.textColor = [UIColor blackColor];
    }
    
    card = newCard;
    
}

@end
