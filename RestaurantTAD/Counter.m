//
//  Counter.m
//  Restaurant
//
//  Created by Diana on 10/12/15.
//  Copyright (c) 2015 Diana. All rights reserved.
//

#import "Counter.h"

@implementation Counter

-(NSNumber *)count: (Tip *)tip
{
    double number;
    number = tip.price.intValue * 0.1;
    if([tip.professionalism intValue] > 5){
        number += tip.price.intValue * [tip.professionalism intValue]/1000;
    }
    else if([tip.professionalism intValue] < 5){
         number -= tip.price.intValue * (10 - [tip.professionalism intValue]) / 1000;
    }
    if([tip.rate intValue] > 5){
        number += tip.price.intValue * [tip.rate intValue]/1000;
    }
    else if([tip.rate intValue] < 5){
        number -= tip.price.intValue * (10 - [tip.rate intValue])/1000;
    }
    if(tip.isPolite!=nil){
        if([tip.isPolite intValue]){
            number += tip.price.intValue/100;
        }
        else {
            number -= tip.price.intValue/100;

        }
    }
    if(tip.isCompyingWithOrder!=nil){
        if([tip.isCompyingWithOrder intValue]){
            number += tip.price.intValue/100;
        }
        else
            number += tip.price.intValue/100;
    }
    if(tip.isHot!=nil){
        if([tip.isHot intValue]){
            number += tip.price.intValue/100;
        }
        else
            number += tip.price.intValue/100;
    }
    NSNumber *result = ([NSNumber numberWithDouble: number]>=0 ? [NSNumber numberWithDouble: number] : [NSNumber numberWithInt:0]);

    
        
    return result;
}

@end
