//
//  MenuTVC.h
//  NoodleMe
//
//  Created by Austin Emser on 11/11/13.
//  Copyright (c) 2013 Austin Emser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuAPI.h"
#import "MenuItemVC.h"

@interface MenuTVC : UITableViewController
@property(nonatomic, strong) NSArray *menu;
@end
