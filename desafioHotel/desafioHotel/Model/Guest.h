//
//  Guest.h
//  desafioHotel
//
//  Created by Filipe Faria on 22/09/15.
//  Copyright © 2015 Filipe Faria. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    RegularGuest = 0,
    VipGuest = 1
} TypeGuest;

@interface Guest : NSObject

- (instancetype)initWithString:(NSString *) guestData;

@end
