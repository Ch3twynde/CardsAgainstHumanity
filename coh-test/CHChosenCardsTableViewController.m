//
//  CHChosenCardsTableViewController.m
//  coh-test
//
//  Created by Miles Alden on 1/28/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import "CHChosenCardsTableViewController.h"
#import "CHGame.h"
#import "CHRound.h"


@interface CHChosenCardsTableViewController ()

@end

@implementation CHChosenCardsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"chosenCard"];
    
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
    return [[[[CHGame game] currentRound] choices] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chosenCard" forIndexPath:indexPath];
    
    // Configure the cell...
    if (!cell) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"card"];
    
    cell.textLabel.text = [[[[CHGame game] currentRound] choices][indexPath.row] message];
    cell.accessoryType =  UITableViewCellAccessoryNone;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = ( cell.accessoryType == UITableViewCellAccessoryCheckmark ) ? UITableViewCellAccessoryNone : UITableViewCellAccessoryCheckmark;
}
@end
