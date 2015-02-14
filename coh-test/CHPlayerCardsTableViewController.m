//
//  CHPlayerCardsTableViewController.m
//  coh-test
//
//  Created by Miles Alden on 1/25/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import "CHPlayerCardsTableViewController.h"

@interface CHPlayerCardsTableViewController ()

@end

@implementation CHPlayerCardsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"card"];
    
    UIBarButtonItem *chooseButton = [[UIBarButtonItem alloc] initWithTitle:@"Choose Cards" style:UIBarButtonItemStylePlain target:self action:@selector(chooseCards)];
    self.navigationItem.rightBarButtonItem = chooseButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.player.hand.cards.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"card" forIndexPath:indexPath];
    
    // Configure the cell...
    if (!cell) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"card"];
    
    cell.textLabel.text = [self.player.hand.cards[indexPath.row] message];
    cell.accessoryType =  UITableViewCellAccessoryNone;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 0)
        return self.player.name;
    
    return @"Unknown";
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = ( cell.accessoryType == UITableViewCellAccessoryCheckmark ) ? UITableViewCellAccessoryNone : UITableViewCellAccessoryCheckmark;
    
}

- (void)chooseCards {
 
    NSLog(@"Hand : %@", self.player.hand);

    NSMutableArray *indices = [NSMutableArray new];
    
    for ( int i = 0; i < self.player.hand.cards.count; i++ ) {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        if ( cell.accessoryType == UITableViewCellAccessoryCheckmark )
            [indices addObject:[NSNumber numberWithInt:i]];
    }

    [self.player.hand chooseCards:indices];
    
    [self.tableView reloadData];
    
    [self.navigationController popViewControllerAnimated:1];
}


@end
