//
//  Hotel.m
//  desafioHotel
//
//  Created by Filipe Faria on 22/09/15.
//  Copyright © 2015 Filipe Faria. All rights reserved.
//

#import "Hotel.h"

@interface Hotel()

@end

@implementation Hotel

- (instancetype)initWithDictionary:(NSDictionary *) dict{
    
    self = [super init];
    
    if (self) {
        self.stars = [[dict objectForKey:@"stars"] intValue];
        self.name = [dict objectForKey:@"name"];
        self.hotelPrices = [[HotelPrices alloc] initWithDictionary:[dict objectForKey:@"prices"]];
    }
    
    return self;
}

@end
