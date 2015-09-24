//
//  Guest.h
//  desafioHotel
//
//  Created by Filipe Faria on 22/09/15.
//  Copyright © 2015 Filipe Faria. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @file Hotel
 @author Filipe Faria
 @version 1.0
 */

typedef enum : NSUInteger {
    RegularGuest = 0,
    VipGuest = 1
} TypeGuest;

@interface Guest : NSObject

/*!
 @brief Variável que define o tipo do cliente
 */
@property (nonatomic, assign) TypeGuest type;

/*!
 @brief Array com todos os dias do cliente
 */
@property (nonatomic, strong) NSArray *days;

- (instancetype)initWithString:(NSString *) guestData;

@end
