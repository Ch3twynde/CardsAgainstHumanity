//
//  CHArrayAdditions.m
//  coh-test
//
//  Created by Miles Alden on 1/24/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import "CHArrayAdditions.h"

@implementation NSArray (CHArrayAdditions)

- (NSArray *)splice:(int)start remove:(int)numRemove insert:(id)newObj {
    
    // Overflow checks
    if ( self.count-1 < start ) return self;
    if ( numRemove > self.count || numRemove + start > self.count-1 ) return self;
    
    NSRange r;
    NSRange r1;
    NSArray *a;
    NSArray *b;
    
    // Start at beginning
    if (start == 0) {
        
        // Insert at beginning
        if ( numRemove > 0 ) {
            
 /*
            r = NSMakeRange(numRemove, (self.count-1 - numRemove));
            NSLog(@"Range 1 %@", NSStringFromRange(r));

            NSArray *temp = [self subarrayWithRange:r];
            if ( !newObj ) a =
            else a = [NSArray arrayWithObject:newObj];
   */         
        }
    }
        
//     = NSMakeRange(0, start);
//     = NSMakeRange(start, numRemove + start - (self.count-1));
    


    
    NSLog(@"Range 2 %@", NSStringFromRange(r1));
    
    NSLog(@"Array result %@ vs %@", self, [a arrayByAddingObjectsFromArray:b]);
    return [a arrayByAddingObjectsFromArray:b];
    
}

@end
