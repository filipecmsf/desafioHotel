//
//  HotelPrices.h
//  desafioHotel
//
//  Created by Filipe Faria on 22/09/15.
//  Copyright © 2015 Filipe Faria. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @file HotelPrices
 @author Filipe Faria
 @version 1.0
 */
@interface HotelPrices : NSObject

- (instancetype) initWithDictionary:(NSDictionary *) dict;

/*!
 @brief Variável com valor do dia útil para clientes regulares
 */
@property (nonatomic, assign) int weekday_regular;

/*!
 @brief Variável com valor do dia útil para clientes vips
 */
@property (nonatomic, assign) int weekday_vip;

/*!
 @brief Variável com valor do final de semana para clientes regulares
 */
@property (nonatomic, assign) int weekend_regular;

/*!
 @brief Variável com valor do final de semana para clientes vips
 */
@property (nonatomic, assign) int weekend_vip;

@end
