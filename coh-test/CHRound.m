//
//  CHRound.m
//  coh-test
//
//  Created by Miles Alden on 1/23/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import "CHRound.h"
#import "CHGame.h"
#import "CHCard.h"

@implementation CHRound

- (void)beginRound {
    
    NSLog(@"Beginning round %lu", (unsigned long)[CHGame game].rounds.count);
    self.choices = [NSMutableArray new];
    [self dealHands];
    
}

- (void)dealHands {
    
    NSLog(@"Dealing hands...");
    CHGame *game = [CHGame game];

    // White cards
    for (CHPlayer *player in self.whitePlayers) {
        
        if ( !player.hand.cards ) player.hand.cards = [NSMutableArray new];
        
        while (player.hand.cards.count < 7) {
            [player.hand.cards addObject:[game.whiteDeck draw]];
        }
        
    }
    
    // Black
    if ( !self.blackPlayer.hand.cards ) self.blackPlayer.hand.cards = [NSMutableArray new];
    
    while (self.blackPlayer.hand.cards.count < 7) {
        [self.blackPlayer.hand.cards addObject:[game.whiteDeck draw]];
    }
    
    self.blackCard = [game.blackDeck draw];
    
}
- (void)chooseWinningCards:(NSArray *)cards {
    
    for ( CHCard *card in cards ) {
        NSUInteger winning = [self.choices indexOfObject:card];
        [(CHCard*)self.choices[winning] setState:CHStateWinning];
    }
    
}


@end
