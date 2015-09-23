//
//  HotelPrices.h
//  desafioHotel
//
//  Created by Filipe Faria on 22/09/15.
//  Copyright © 2015 Filipe Faria. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelPrices : NSObject

- (instancetype) initWithDictionary:(NSDictionary *) dict;

@property (nonatomic, assign) int weekday_regular;
@property (nonatomic, assign) int weekday_vip;
@property (nonatomic, assign) int weekend_regular;
@property (nonatomic, assign) int weekend_vip;

@end
