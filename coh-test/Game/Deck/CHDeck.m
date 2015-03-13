//
//  CHDeck.m
//  coh-test
//
//  Created by Miles Alden on 12/27/14.
//  Copyright (c) 2014 ensighten. All rights reserved.
//

#import "CHDeck.h"
#import "CHCard.h"

@implementation CHDeck

- (CHCard *)draw {
    if (!self.cards) {
        [self build];
        [self shuffle];
        [self shuffle];
        self.drawIndex = 0;
    }
    
    CHCard *card = self.cards[self.drawIndex];
    self.drawIndex++;
    
    while ( card.state != CHStateUnplayed ) {
        self.drawIndex++;
        card = self.cards[self.drawIndex];
    }
    
    return card;
}

- (void)shuffle {
    
    if ( [self count] < 1 ) return;
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [self.cards exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
    
    
}
- (unsigned long)count {
    return self.cards.count;
}
- (void)build {
    
    self.cards = [NSMutableArray new];
    self.drawIndex = 0;
    Class cardClass = ( self.class == NSClassFromString(@"CHWhiteDeck") ) ? NSClassFromString(@"CHWhiteCard") : NSClassFromString(@"CHBlackCard");
    NSError *e;
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = ( self.class == NSClassFromString(@"CHWhiteDeck") ) ? @"White Pages/Converted Text/" : @"Black Pages/Converted Text/";
    path = [[bundle bundlePath] stringByAppendingPathComponent:path];
    
    NSArray *pages = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:&e];
    if (e) {
        NSLog(@"Error ? %@", e);
        return;
    }
    
    int cardNumber = 0;
    for ( NSString *page in pages ) {
    
//        NSLog(@"Page path : %@", [path stringByAppendingPathComponent:page]);
        NSString *body = [NSString stringWithContentsOfFile:[path stringByAppendingPathComponent:page]
                                                   encoding:NSUTF8StringEncoding
                                                      error:&e];
        NSMutableArray *messages = [NSMutableArray arrayWithArray:[body componentsSeparatedByString:@"\n"]];
        if (e)
            NSLog(@"Error ? %@", e);
        
        for ( NSString *message in messages ) {
            
            if ( message.length > 0 ) {
                CHCard *c = [cardClass new];
                c.message = message;
                c.state = CHStateUnplayed;
                c.number = cardNumber;
                [self.cards addObject:c];
            }
        }
        
        cardNumber++;
    }

    
    [self shuffle];
    
    
}

@end
