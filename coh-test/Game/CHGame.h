//
//  CHGame.h
//  coh-test
//
//  Created by Miles Alden on 1/23/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHWhiteDeck.h"
#import "CHBlackDeck.h"
#import "CHPlayer.h"
#import "CHRound.h"

@interface CHGame : NSObject

@property (strong) NSMutableArray *players;
@property (strong) CHWhiteDeck *whiteDeck;
@property (strong) CHBlackDeck *blackDeck;
@property (strong) NSMutableArray *rounds;
@property unsigned int round;
@property unsigned int maxRounds;

+ (CHGame *)game;
- (void)startGame;
- (void)addPlayer:(CHPlayer *)player;
- (void)nextRound;
- (CHPlayer *)playerByName:(NSString *)name;
- (CHRound *)currentRound;

@end
