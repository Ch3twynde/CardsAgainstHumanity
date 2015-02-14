//
//  CHGame.m
//  coh-test
//
//  Created by Miles Alden on 1/23/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import "CHGame.h"
#import "CHArrayAdditions.h"

@implementation CHGame
@synthesize round;

static CHGame *game;

+ (CHGame *)game
{
    if ( game == nil ) {
        game = [[CHGame alloc] init];
        return game;
    }
    
    return game;
}

- (id)init {
    
    if ( self = [super init] ) {
        // Do stuff
    }
    
    return self;
}

+ (id)allocWithZone:(NSZone *)zone {
    @synchronized(self) {
        if (game == nil) {
            game = [super allocWithZone:zone];
            game.rounds = [NSMutableArray new];
            game.players = [NSMutableArray new];
            return game;  // assignment and return on first allocation
        }
    }
    return nil; // on subsequent allocation attempts return nil
    
}

- (id)copyWithZone:(NSZone *)zone{
    return self;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"<%@ %p> players : %@ rounds : %@", self.class, self, self.players, self.rounds];
    
}
- (CHRound *)currentRound {
    return self.rounds[self.round];
}

- (unsigned int)round {
    if ( !self.rounds ) return 0;
    return (unsigned int)self.rounds.count-1;
}
- (void)setRound:(unsigned int)_round {
    round = _round;
}
- (void)startGame {

    NSLog(@"Starting new game...");
    
    NSLog(@"Building white deck");
    self.whiteDeck = [CHWhiteDeck new];
    [self.whiteDeck build];
    
    [self.whiteDeck shuffle];
    [self.whiteDeck shuffle];
    
    NSLog(@"Building black deck");
    self.blackDeck = [CHBlackDeck new];
    [self.blackDeck build];
    
    [self.blackDeck shuffle];
    [self.blackDeck shuffle];
//    NSLog(@"Black cards : %@", self.blackDeck.cards);
    
    // Dummy
    NSArray *names = @[@"Joe", @"Bill", @"Sam", @"Harry", @"Hagrid", @"Hermoine"];
    for ( NSString *name in names ) {
    
        CHPlayer *player = [CHPlayer new];
        player.name = name;
        player.state = CHPlayerWhitePlayer;
        player.hand = [CHHand new];
        [self addPlayer:player];
    }
    
    [self nextRound];
    
    
    NSLog(@"Game : %@", self);
    
}
- (void)addPlayer:(CHPlayer *)player {
    
    NSLog(@"Adding new player %@...", player);
    if (!self.players) self.players = [NSMutableArray new];
    
    if (player)
        [self.players addObject:player];
    else {
        NSException *e = [NSException exceptionWithName:@"Player was nil" reason:@"Attempted to add a nil player" userInfo:@{ @"location" : [NSString stringWithUTF8String:__PRETTY_FUNCTION__] }];
        [e raise];
    }
    
}
- (void)nextRound {
    
    CHRound *newRound = [CHRound new];
    int blackPlayerIndex = arc4random() % self.players.count;
    newRound.blackPlayer = self.players[blackPlayerIndex];
    newRound.blackPlayer.state = CHPlayerBlackPlayer;
    newRound.whitePlayers = (^(){
        
        NSMutableArray *ret = [NSMutableArray new];
        
        for ( CHPlayer *player in self.players ) {
            if ( player.state == CHPlayerWhitePlayer )
                [ret addObject:player];
        }
        
        return ret;
    })();
    
    [self.rounds addObject:newRound];
    
    [newRound beginRound];
}
- (CHPlayer *)playerByName:(NSString *)name {
    for ( CHPlayer *player in self.players ) {
        if ( [name isEqualToString:player.name] )
            return player;
    }
    return nil;
}


@end
