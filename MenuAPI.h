//
//  MenuAPI.h
//  NoodleMe
//
//  Created by Austin Emser on 11/16/13.
//  Copyright (c) 2013 Austin Emser. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebAPIConfig.h"

@interface MenuAPI : NSObject
+(NSArray *) recentMenu;
@end
