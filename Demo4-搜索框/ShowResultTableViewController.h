//
//  ShowResultTableViewController.h
//  Demo4-搜索框
//
//  Created by tarena on 16/1/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
本控制器是用于显示搜索结果的控制器
是被搜索框使用的，所以，它的功能就是，由使用者
提供一组数据，它负责显示即可
*/
@interface ShowResultTableViewController : UITableViewController

//NSArray<Product *>
@property(nonatomic,strong)NSArray *resultData;

@end




