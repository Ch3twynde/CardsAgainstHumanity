//
//  CHHand.m
//  coh-test
//
//  Created by Miles Alden on 1/23/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import "CHHand.h"
#import "CHGame.h"

@implementation CHHand

- (void)chooseCards:(NSArray *)indices {
    
    for ( NSNumber *n in indices ) {
        NSLog(@"Batching %d", [n intValue]);
        [self choose:[n intValue]];
    }
    
    NSMutableArray *tmp = self.cards;
    self.cards = [NSMutableArray new];
    for ( CHCard *c in tmp )
        if ( c.state == CHStateUnplayed ) [self.cards addObject:c];
    
}

- (CHCard *)choose:(unsigned int)index {
    
    if ( index < self.cards.count ) {
        NSLog(@"Choosing [%d] %@", index, self.cards[index]);
        return [self discard:index];
    }
    
    return nil;
}
- (CHCard *)discard:(unsigned int)index {
    
    CHCard *ret;
    if ( index < self.cards.count ) {
        ret = self.cards[index];
        ret.state = CHStatePlayed;
        
        NSLog(@"Discarding [%d] %@", index, self.cards[index]);
        
        CHGame *game = [CHGame game];
        CHRound *currentRound = [game currentRound];
        [currentRound.choices addObject:ret];
        
//        [self.cards removeObjectAtIndex:index];
    }
    
    return ret;
}
- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ %p> cards : %@", self.class, self, self.cards];
}

@end
