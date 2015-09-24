//
//  HotelControl.h
//  desafioHotel
//
//  Created by Filipe Faria on 22/09/15.
//  Copyright © 2015 Filipe Faria. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 @file HotelControl
 @author Filipe Faria
 @version 1.0
 */

@interface HotelControl : NSObject

/*!
 @brief Método responsável por carregar os dados dos plist nas variáveis
 
 @return Não possui retorno
 */
- (void) loadDataFromPlists;

/*!
 @brief Método responsável por identificar o melhor

 @return Retorna a lista com as melhores opções para cara cliente.
 */
- (NSArray *) checkBestHotelChoice;

@end
