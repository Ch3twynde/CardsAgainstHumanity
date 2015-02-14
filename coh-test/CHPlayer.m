//
//  CHPlayer.m
//  coh-test
//
//  Created by Miles Alden on 1/23/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import "CHPlayer.h"

@implementation CHPlayer
@synthesize state;

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ %p> name : %@ state : %@", self.class, self, self.name, self.stateAsString];
}

- (CHPlayerState)state {
    return state;
}
- (void)setState:(CHPlayerState)newState {
    
    state = newState;
    
    if ( newState == CHPlayerWhitePlayer ) self.stateAsString = @"CHPlayerWhitePlayer";
    if ( newState == CHPlayerBlackPlayer ) self.stateAsString = @"CHPlayerBlackPlayer";
    
}
@end
