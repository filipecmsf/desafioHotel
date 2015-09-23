//
//  Hotel.h
//  desafioHotel
//
//  Created by Filipe Faria on 22/09/15.
//  Copyright © 2015 Filipe Faria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HotelPrices.h"

@interface Hotel : NSObject

@property (nonatomic, assign) int stars;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) HotelPrices *hotelPrices;

- (instancetype)initWithDictionary:(NSDictionary *) dict;

@end
