//
//  CHPlayersTableViewController.m
//  coh-test
//
//  Created by Miles Alden on 2/13/15.
//  Copyright (c) 2015 ensighten. All rights reserved.
//

#import "CHPlayersTableViewController.h"
#import "CHPlayerCardsTableViewController.h"
#import "CHGame.h"
#import "CHRound.h"

@interface CHPlayersTableViewController ()

@end

@implementation CHPlayersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"player"];
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
    return [CHGame game].players.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell...
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"player" forIndexPath:indexPath];
    
    // Configure the cell...
    if (!cell) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"player"];
    
    CHPlayer *player = [CHGame game].players[indexPath.row];
    cell.textLabel.text = player.name;
    if ( player.state == CHPlayerBlackPlayer ) {
        cell.backgroundColor = [UIColor blackColor];
        cell.textLabel.textColor = [UIColor whiteColor];
    } else {
        cell.backgroundColor = [UIColor whiteColor];
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
//    for ( CHPlayer *player in [CHGame game].players ) {
//
//        UIButton *playerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        [playerButton addTarget:self action:@selector(playerButton:) forControlEvents:UIControlEventTouchDown];
//        [playerButton setFrame:CGRectMake (0,(44+navHeight)*i, 60,44)];
//        [playerButton setBackgroundColor:[UIColor whiteColor]];
//        [playerButton setTitle:player.name forState:UIControlStateNormal];
//        [playerButton setTag:111];
//        [playerButton sizeToFit];
//        [self.view addSubview:playerButton];
//        //        playerButton.center = self.view.center;
//        
//        i++;
//    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:1];
    
    CHPlayer *player = [CHGame game].players[indexPath.row];
    if ( player.state == CHPlayerBlackPlayer ) {
        NSLog(@"Black player does not contribute cards");
        return;
    }
    
    CHPlayerCardsTableViewController* playerCardsVC = [[CHPlayerCardsTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    playerCardsVC.player = player;
    playerCardsVC.title = @"Hand";
    
    NSLog(@"Acting as %@", player);

    if ( self.parentNavController )
        [self.parentNavController pushViewController:playerCardsVC animated:YES];
}

@end
