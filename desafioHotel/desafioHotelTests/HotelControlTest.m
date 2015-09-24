//
//  HotelControlTest.m
//  desafioHotel
//
//  Created by Filipe Faria on 24/09/15.
//  Copyright © 2015 Filipe Faria. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HotelControl.h"
#import "Guest.h"

@interface HotelControlTest : XCTestCase

@property (nonatomic) HotelControl *hotelControlTest;

@end

@interface HotelControl (Test)

- (int) getWeekDay:(NSString *) fullday;
- (void) getPriceForDay:(int)day withGuestType:(TypeGuest) type;
@property (nonatomic, strong) NSArray *hotelList;
@property (nonatomic, strong) NSArray *guestList;
@property (nonatomic, strong) NSMutableDictionary *hotelPriceDict;
@property (nonatomic, strong) NSMutableArray *priceDict;

@end

@implementation HotelControlTest

- (void)setUp {
    [super setUp];
    self.hotelControlTest = [[HotelControl alloc] init];
    [self.hotelControlTest loadDataFromPlists];
}

- (void)tearDown {
    [super tearDown];
}

- (void) testGetWeekDaySuccess{
    XCTAssertTrue([self.hotelControlTest getWeekDay:@"24/09/15(seg)"] == 0);
    XCTAssertTrue([self.hotelControlTest getWeekDay:@"24/09/15(ter)"] == 0);
    XCTAssertTrue([self.hotelControlTest getWeekDay:@"24/09/15(qua )"] == 0);
    XCTAssertTrue([self.hotelControlTest getWeekDay:@"24/09/15(qui)"] == 0);
    XCTAssertTrue([self.hotelControlTest getWeekDay:@"24/09/15( sex)"] == 0);
    XCTAssertTrue([self.hotelControlTest getWeekDay:@"24/09/15(sab)"] == 1);
    XCTAssertTrue([self.hotelControlTest getWeekDay:@"24/09/15(dom)"] == 1);
    XCTAssertTrue([self.hotelControlTest getWeekDay:@"24/09/15(Sae)"] == -1);
    XCTAssertTrue([self.hotelControlTest getWeekDay:@"24/09/15(SAB)"] == 1);
    XCTAssertTrue([self.hotelControlTest getWeekDay:@"24/09/15(sAb)"] == 1);
    XCTAssertTrue([self.hotelControlTest getWeekDay:@"24/09/15(TEr )"] == 0);
    XCTAssertTrue([self.hotelControlTest getWeekDay:@"24/09/15( TER "] == 0);
    XCTAssertTrue([self.hotelControlTest getWeekDay:@"( )"] == -1);
    XCTAssertTrue([self.hotelControlTest getWeekDay:@""] == -1);
}

- (void) testGetWeekDayFailure{
    XCTAssertFalse([self.hotelControlTest getWeekDay:@"24/09/15[seg]"] == 1);
    XCTAssertFalse([self.hotelControlTest getWeekDay:@"24/09/ter)"] == 1);
    XCTAssertFalse([self.hotelControlTest getWeekDay:@"24/09/15(qua)"] == 1);
    XCTAssertFalse([self.hotelControlTest getWeekDay:@"24/09/15(qui )"] == 1);
    XCTAssertFalse([self.hotelControlTest getWeekDay:@"24/09/15(sab)"] == 0);
    XCTAssertFalse([self.hotelControlTest getWeekDay:@""] == 0);
}

- (void) testGetPriceSuccess{
    self.hotelControlTest.hotelPriceDict = [[NSMutableDictionary alloc] init];
    [self.hotelControlTest getPriceForDay:0 withGuestType:VipGuest];
    XCTAssertTrue(self.hotelControlTest.hotelPriceDict.count == self.hotelControlTest.hotelList.count);
}




@end
