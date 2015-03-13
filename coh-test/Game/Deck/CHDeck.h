//
//  CHDeck.h
//  coh-test
//
//  Created by Miles Alden on 12/27/14.
//  Copyright (c) 2014 ensighten. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CHCard;

@interface CHDeck : NSObject

@property (strong) NSMutableArray *cards;
@property unsigned int drawIndex;

- (CHCard *)draw;
- (void)shuffle;
- (unsigned long)count;
- (void)build;

@end
