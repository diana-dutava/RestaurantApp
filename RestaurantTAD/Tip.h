//
//  Tip.h
//  Restaurant
//
//  Created by Diana on 10/12/15.
//  Copyright (c) 2015 Diana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tip : NSObject

@property NSNumber *isPolite;
@property NSNumber *professionalism;
@property NSNumber *rate;
@property NSNumber *isCompyingWithOrder;
@property NSNumber *isHot;
@property NSNumber *price;


-(id) initWithPrice: (NSNumber *) pr prof: (NSNumber *) prof rate:(NSNumber *) rate;


@end
