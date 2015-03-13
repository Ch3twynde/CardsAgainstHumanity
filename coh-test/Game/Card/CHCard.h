//
//  CHCard.h
//  coh-test
//
//  Created by Miles Alden on 12/26/14.
//  Copyright (c) 2014 ensighten. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHCard : NSObject


typedef enum CHCardState {
    
    CHStateUnplayed = 0,
    CHStatePlayed = 1,
    CHStateWinning = 2,
    CHStateOther = 3
    
} CHCardState;

@property (strong) NSString *message;
@property (strong) NSString *stateAsString;

@property int number;
@property CHCardState state;


@end
