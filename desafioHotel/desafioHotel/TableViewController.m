//
//  ViewController.m
//  desafioHotel
//
//  Created by Filipe Faria on 22/09/15.
//  Copyright © 2015 Filipe Faria. All rights reserved.
//

#import "TableViewController.h"
#import "HotelControl.h"

@interface TableViewController ()

@property (nonatomic, strong) HotelControl *hotelControl;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hotelControl = [[HotelControl alloc] init];
    
    [self.hotelControl loadDataFromPlists];
    [self.hotelControl checkBestHotelChoice];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
