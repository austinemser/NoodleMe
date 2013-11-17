//
//  MenuTVC.m
//  NoodleMe
//
//  Created by Austin Emser on 11/11/13.
//  Copyright (c) 2013 Austin Emser. All rights reserved.
//

#import "MenuTVC.h"

@implementation MenuTVC

-(void)setMenu:(NSArray *)menu
{
    if(_menu != menu)
    {
        _menu = menu;
        [self.tableView reloadData];
    }
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Menu";
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc]
                                        initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2,[UIScreen mainScreen].bounds.size.height/2);
    //[self.view addSubview:spinner];
    
    [spinner hidesWhenStopped];
    [spinner startAnimating];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:spinner];
    
    
    dispatch_queue_t loadQueue = dispatch_queue_create("viewdidload initial queue", NULL);
    dispatch_async(loadQueue, ^{
        NSMutableArray *arraySort = [[NSMutableArray alloc] init];
        NSSortDescriptor *descriptior = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES];
        [arraySort sortUsingDescriptors:[NSArray arrayWithObjects:descriptior,nil]];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [spinner stopAnimating];
            self.menu = [arraySort copy];
        });
    });
    
    
    self.menu = [MenuAPI recentMenu];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.menu count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Menu Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    NSDictionary *menuItem = self.menu[indexPath.row];
    NSString *title = menuItem[@"title"];
    NSString *description = menuItem[@"description"];
    
    
    
    cell.textLabel.text = title;
    cell.detailTextLabel.text = description;
    
    return cell;
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"Menu Item"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *menuItem = [self.menu objectAtIndex:indexPath.row];

        [segue.destinationViewController setMenuItem:menuItem];
    }
}


@end
