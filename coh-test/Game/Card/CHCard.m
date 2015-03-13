//
//  CHCard.m
//  coh-test
//
//  Created by Miles Alden on 12/26/14.
//  Copyright (c) 2014 ensighten. All rights reserved.
//

#import "CHCard.h"
#import <Foundation/Foundation.h>

@implementation CHCard
@synthesize state;

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p> state: %@ message : %@", self.class, self, self.stateAsString, self.message];
}
- (CHCardState)state {
    return state;
}
- (void)setState:(CHCardState)newState {
    
    state = newState;
    
    if ( newState == CHStateUnplayed ) self.stateAsString = @"CHStateUnplayed";
    if ( newState == CHStatePlayed ) self.stateAsString = @"CHStatePlayed";
    if ( newState == CHStateOther ) self.stateAsString = @"CHStateOther";
    
}

@end
