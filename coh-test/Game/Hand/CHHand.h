//
//  CHHand.h
//  coh-test
//
//  Created by Miles Alden on 1/23/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CHCard;
@interface CHHand : NSObject

@property (strong) NSMutableArray *cards;
- (void)chooseCards:(NSArray *)indices;
- (CHCard *)choose:(unsigned int)index;
- (CHCard *)discard:(unsigned int)index;

@end
