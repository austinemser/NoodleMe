//
//  MenuAPI.m
//  NoodleMe
//
//  Created by Austin Emser on 11/13/13.
//  Copyright (c) 2013 Austin Emser. All rights reserved.
//

#import "MenuAPI.h"


@implementation MenuAPI

+(NSDictionary *)executeMenuAPIRequest
{
    NSString *query = [NSString stringWithFormat:@"%@", MenusUrl];
    [query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    NSData *jsonData = [[NSString stringWithContentsOfURL:[NSURL URLWithString:query] encoding:NSUTF8StringEncoding error:nil]
                        dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *results = jsonData ? [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error] : nil;
    return results;
}

+(NSArray *)recentMenu
{
    NSMutableArray *menu = [[NSMutableArray alloc] init];
    for(NSDictionary *dict in [self executeMenuAPIRequest])
    {
        [menu addObject:dict];
    }
    NSLog(@"%@", menu);
    return [menu copy];
}



@end
