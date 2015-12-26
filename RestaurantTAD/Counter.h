//
//  Counter.h
//  Restaurant
//
//  Created by Diana on 10/12/15.
//  Copyright (c) 2015 Diana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tip.h"

@interface Counter : NSObject

-(NSNumber *)count: (Tip *) tip;

@end
