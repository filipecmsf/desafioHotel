//
//  Hotel.h
//  desafioHotel
//
//  Created by Filipe Faria on 22/09/15.
//  Copyright © 2015 Filipe Faria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HotelPrices.h"


/*!
@file Hotel
@author Filipe Faria
@version 1.0
*/
@interface Hotel : NSObject

/*!
 @brief Estrelas do hotel
 */
@property (nonatomic, assign) int stars;

/*!
 @brief Nome do hotel
 */
@property (nonatomic, strong) NSString *name;

/*!
 @brief Objeto que possui os preços do hotel
 */
@property (nonatomic, strong) HotelPrices *hotelPrices;

- (instancetype)initWithDictionary:(NSDictionary *) dict;

@end
