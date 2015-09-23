//
//  Guest.m
//  desafioHotel
//
//  Created by Filipe Faria on 22/09/15.
//  Copyright © 2015 Filipe Faria. All rights reserved.
//

#import "Guest.h"

@interface Guest()

@end

@implementation Guest

- (instancetype)initWithString:(NSString *) guestData{

    self = [super init];
    
    if (self) {
        NSArray *arr = [guestData componentsSeparatedByString:@":"];
        if([arr count] == 2){
            
            //define guest type
            self.type = VipGuest;
            
            if ([[arr objectAtIndex:0] isEqualToString:@"regular"]) {
                self.type = RegularGuest;
            }
            
            NSString *timeString = [arr objectAtIndex:1];
            self.days = [timeString componentsSeparatedByString:@","];
            
        }
    }
    
    return self;
}

@end
