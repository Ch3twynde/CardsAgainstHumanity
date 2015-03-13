//
//  CHPlayer.h
//  coh-test
//
//  Created by Miles Alden on 1/23/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHHand.h"

@interface CHPlayer : NSObject

typedef enum CHPlayerState {
    CHPlayerWhitePlayer = 0,
    CHPlayerBlackPlayer = 1
} CHPlayerState;

@property NSString *name;
@property CHPlayerState state;
@property NSString *stateAsString;
@property NSMutableArray *winningCards;
@property CHHand *hand;


@end
