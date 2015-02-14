//
//  CHRound.h
//  coh-test
//
//  Created by Miles Alden on 1/23/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CHPlayer.h"
#import "CHBlackCard.h"
#import "CHWhiteCard.h"

@interface CHRound : NSObject

@property (strong) CHPlayer *blackPlayer;
@property (strong) NSMutableArray *whitePlayers;
@property (strong) CHBlackCard *blackCard;
@property (strong) NSMutableArray *choices;
@property (strong) CHWhiteCard *chosenCard;

- (void)beginRound;
- (void)chooseWinningCards:(NSArray *)cards;

@end
