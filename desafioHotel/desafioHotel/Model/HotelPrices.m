//
//  HotelPrices.m
//  desafioHotel
//
//  Created by Filipe Faria on 22/09/15.
//  Copyright © 2015 Filipe Faria. All rights reserved.
//

#import "HotelPrices.h"

@implementation HotelPrices

- (instancetype) initWithDictionary:(NSDictionary *) dict{
    
    self = [super init];
    
    if (self) {
        if( [dict objectForKey:@"weekday_regular"] && [dict objectForKey:@"weekday_vip"] && [dict objectForKey:@"weekend_regular"] && [dict objectForKey:@"weekend_vip"] ){
            
            self.weekday_regular = [[dict objectForKey:@"weekday_regular"] intValue];
            self.weekday_vip = [[dict objectForKey:@"weekday_vip"] intValue];
            self.weekend_regular = [[dict objectForKey:@"weekend_regular"] intValue];
            self.weekend_vip = [[dict objectForKey:@"weekend_vip"] intValue];
        }
    }
    
    return self;
}

@end
