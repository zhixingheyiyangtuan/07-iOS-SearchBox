//
//  ShowResultTableViewController.m
//  Demo4-搜索框
//
//  Created by tarena on 16/1/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ShowResultTableViewController.h"


@interface ShowResultTableViewController ()

@end

@implementation ShowResultTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MyCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resultData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.resultData[indexPath.row];
    
    return cell;
}




@end
