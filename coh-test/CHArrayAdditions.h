//
//  CHArrayAdditions.h
//  coh-test
//
//  Created by Miles Alden on 1/24/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (CHArrayAdditions)

- (NSArray *)splice:(int)start remove:(int)numRemove insert:(id)newObj;

@end
