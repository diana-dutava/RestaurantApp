//
//  Tip.m
//  Restaurant
//
//  Created by Diana on 10/12/15.
//  Copyright (c) 2015 Diana. All rights reserved.
//

#import "Tip.h"

@implementation Tip

@synthesize isPolite = _isPolite;
@synthesize professionalism = _professionalism;
@synthesize rate = _rate;
@synthesize isCompyingWithOrder = _isCompyingWithOrder;
@synthesize isHot = _isHot;
@synthesize price = _price;

-(id)initWithPrice:(NSNumber *)pr prof:(NSNumber *)prof rate:(NSNumber *)rate
{
    self = [super init];
    if(self)
    {
        [self setPrice: pr];
        [self setProfessionalism: prof];
        [self setRate: rate];
    }
    return self;
}

@end
