//
//  Globals.h
//  GameWithNoName
//
//  Created by mike.tihonchik on 11/7/13.
//  Copyright (c) 2013 mike.tihonchik. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IPHONE_5 568
#define NON_IPHONE_5 480
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

@interface Globals : NSObject

@end
