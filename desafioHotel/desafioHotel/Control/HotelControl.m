//
//  HotelControl.m
//  desafioHotel
//
//  Created by Filipe Faria on 22/09/15.
//  Copyright © 2015 Filipe Faria. All rights reserved.
//

#import "HotelControl.h"
#import "Hotel.h"
#import "Guest.h"

#define HOTEL_LIST_NAME @"HotelList"
#define GUEST_LIST_NAME @"GuestList"

@interface HotelControl ()

@property (nonatomic, strong) NSArray *hotelList;
@property (nonatomic, strong) NSArray *guestList;
@property (nonatomic, strong) NSMutableDictionary *priceDict;

@end

@implementation HotelControl

- (void)loadDataFromPlists{
    
    self.priceDict = [[NSMutableDictionary alloc] init];
    
    [self loadPlistWithName:HOTEL_LIST_NAME];
    [self loadPlistWithName:GUEST_LIST_NAME];
}

- (NSArray *)checkBestHotelChoice{
    
    for (Guest *guest in self.guestList) {
        for (NSString *fullday in guest.days) {
            [self getPriceForDay:[self getWeekDay:fullday] withGuestType:guest.type];
        }
        NSLog(@"teste");
    }
    return nil;
}


#pragma mark - check data methods

- (int) getWeekDay:(NSString *) fullday{
    
    NSString *day = [[[[fullday componentsSeparatedByString:@"("] objectAtIndex:1] componentsSeparatedByString:@")"] objectAtIndex:0];
    day = [[day stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] lowercaseString];
    
    if([day isEqualToString:@"seg"] || [day isEqualToString:@"ter"] ||
       [day isEqualToString:@"qua"] || [day isEqualToString:@"qui"] ||
       [day isEqualToString:@"sex"]){
    
        return 0;
    
    }
    else if ([day isEqualToString:@"sab"] || [day isEqualToString:@"dom"] ){
    
        return 1;
    
    }
    
    return -1;
}

- (NSArray *) getPriceForDay:(int)day withGuestType:(TypeGuest) type{

    int typePrice = -1;
    
    if (type == RegularGuest && day == 0) {
        typePrice = 0;
    }
    else if(type == RegularGuest && day == 1){
        typePrice = 1;
    }
    else if(type == VipGuest && day == 0){
        typePrice = 2;
    }
    else if(type == VipGuest && day == 1){
        typePrice = 3;
    }
    
    for (Hotel *hotel in self.hotelList) {
        
        int totalPrice = [[self.priceDict objectForKey:hotel.name] intValue];
        
        switch (typePrice) {
            case 0:
                totalPrice += hotel.hotelPrices.weekday_regular;
                break;
            
            case 1:
                totalPrice += hotel.hotelPrices.weekend_regular;
                break;

            case 2:
                totalPrice += hotel.hotelPrices.weekday_vip;
                break;
            
            case 3:
                totalPrice += hotel.hotelPrices.weekend_vip;
                break;
        }
        [self.priceDict setObject:[NSNumber numberWithInt:totalPrice] forKey:hotel.name];
    }
    

    return nil;
}

#pragma mark - load data methods

- (void) loadPlistWithName:(NSString *) fileName{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    NSArray *contentArray = [NSArray arrayWithContentsOfFile:path];

    if([fileName isEqualToString:HOTEL_LIST_NAME]){
        [self loadHotelList:contentArray];
    }
    else{
        [self loadGuestList:contentArray];
    }
}

- (void) loadHotelList:(NSArray *) list{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (NSDictionary *hotelDict in list) {
        Hotel *hotel = [[Hotel alloc] initWithDictionary:hotelDict];
        [arr addObject:hotel];
        
        [self.priceDict setObject:[NSNumber numberWithInt:0] forKey:hotel.name];
    }
    
    self.hotelList = arr;
    
}

- (void) loadGuestList:(NSArray *) list{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (NSString *guestString in list) {
        Guest *guest = [[Guest alloc] initWithString:guestString];
        [arr addObject:guest];
    }
    
    self.guestList = arr;
}

@end
