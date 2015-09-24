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
/*!
@brief Array com a lista dos hoteis
 */
@property (nonatomic, strong) NSArray *hotelList;

/*!
 @brief Array com a lista dos hoteis
 */
@property (nonatomic, strong) NSArray *guestList;

/*!
 @brief Array com o preço de cada hotel para cada cliente
 */
@property (nonatomic, strong) NSMutableDictionary *hotelPriceDict;

/*!
 @brief Array com a strings do melhor preço para cada cliente
 */
@property (nonatomic, strong) NSMutableArray *priceDict;

/*!
 @brief Método responsável por determinar qual o melhor hotel para o cliente baseado no preço total da estadia, caso o valor de dois ou mais hoteis fiquem igual, é recomendado o com maior quantidade de estrelas.
 
 @return Retorna uma string com o nome do hotel e o valor da estadia
 */

- (NSString *) getBestHotel;

/*!
 @brief método responsavel por definir se o dia informado é um dia útil ou final de semana
 @return retorna um inteiro, sendo 0 para dia útil, 1 para final de semana e -1 caso ocorra algum erro.
 */
- (int) getWeekDay:(NSString *) fullday;

/*!
 @brief Método responsavel localizar o preço da diaria de cada hotel para o tipo de cliente e o dia
 @return não possui retorno
 */
- (void) getPriceForDay:(int)day withGuestType:(TypeGuest) type;

@end

@implementation HotelControl

- (void)loadDataFromPlists{
    
    [self loadPlistWithName:HOTEL_LIST_NAME];
    [self loadPlistWithName:GUEST_LIST_NAME];
}

- (NSArray *)checkBestHotelChoice{
    
    self.priceDict = [[NSMutableArray alloc] initWithCapacity:self.guestList.count];
    
    for (Guest *guest in self.guestList) {
        
        self.hotelPriceDict = [[NSMutableDictionary alloc] init];
        
        for (NSString *fullday in guest.days) {
            [self getPriceForDay:[self getWeekDay:fullday] withGuestType:guest.type];
        }
        [self.priceDict addObject:[self getBestHotel]];
    }
    return self.priceDict;
}

- (NSString *) getBestHotel{
    int bestPrice = 0;
    Hotel *bestHotel;
    
    for (int i = 0; i < self.hotelList.count; i++){
        Hotel *hotel = [self.hotelList objectAtIndex:i];
        int total = [[self.hotelPriceDict objectForKey:hotel.name] intValue];
        
        if(bestPrice == 0 || bestPrice > total || (bestPrice == total && bestHotel.stars < hotel.stars)){
            bestHotel = hotel;
            bestPrice = total;
        }
    }
    
    NSString *bestOptionString = [NSString stringWithFormat:@"%@: R$%i",bestHotel.name, bestPrice];
    return bestOptionString;
    
}

#pragma mark - check data methods

- (int) getWeekDay:(NSString *) fullday{
    
    id day = [fullday componentsSeparatedByString:@"("];

    //validação se a string enviada pode ser dividida para pegar o dia da semana
    if([day count] == 2){
        day = [[[day objectAtIndex:1]componentsSeparatedByString:@")"] objectAtIndex:0];
        day = [[day stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] lowercaseString];
        
        if([day isEqualToString:@"seg"] || [day isEqualToString:@"ter"] ||
           [day isEqualToString:@"qua"] || [day isEqualToString:@"qui"] ||
           [day isEqualToString:@"sex"]){
            
            return 0;
            
        }
        else if ([day isEqualToString:@"sab"] || [day isEqualToString:@"dom"] ){
            
            return 1;
            
        }
    }
    
    NSLog(@"dia da semana invalido! %@", fullday);
    
    return -1;
}

- (void) getPriceForDay:(int)day withGuestType:(TypeGuest) type{

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
    
    if(typePrice != -1){
        for (Hotel *hotel in self.hotelList) {
            
            int totalPrice = [[self.hotelPriceDict objectForKey:hotel.name] intValue];
            
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
            [self.hotelPriceDict setObject:[NSNumber numberWithInt:totalPrice] forKey:hotel.name];
        }
    }
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
        
        [self.hotelPriceDict setObject:[NSNumber numberWithInt:0] forKey:hotel.name];
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
