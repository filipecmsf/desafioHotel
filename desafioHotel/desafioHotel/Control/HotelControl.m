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

@end

@implementation HotelControl

- (void)loadDataFromPlists{
    [self loadPlistWithName:HOTEL_LIST_NAME];
    [self loadPlistWithName:GUEST_LIST_NAME];
    NSLog(@"Data loaded!");
}

- (NSArray *)checkBestHotelChoice{
    return nil;
}

#pragma mark - internal methods

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
