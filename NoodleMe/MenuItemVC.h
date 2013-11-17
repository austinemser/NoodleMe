//
//  MenuItemVC.h
//  NoodleMe
//
//  Created by Austin Emser on 11/13/13.
//  Copyright (c) 2013 Austin Emser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuItemVC : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;
@property (nonatomic, strong) NSDictionary *menuItem;

@end
