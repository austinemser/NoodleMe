//
//  MenuItemVC.m
//  NoodleMe
//
//  Created by Austin Emser on 11/13/13.
//  Copyright (c) 2013 Austin Emser. All rights reserved.
//

#import "MenuItemVC.h"

@interface MenuItemVC ()

@end

@implementation MenuItemVC

@synthesize menuItem = _menuItem;

-(void)setMenuItem:(NSDictionary *)menuItem
{
    if(_menuItem != menuItem)
    {
        _menuItem = menuItem;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.urlLabel.Text = self.menuItem[@"url"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
