//
//  MainTableViewController.m
//  Demo4-搜索框
//
//  Created by tarena on 16/1/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MainTableViewController.h"
#import "ShowResultTableViewController.h"


@interface MainTableViewController ()<UISearchResultsUpdating,UISearchBarDelegate>
//1.存储全部数据
@property(nonatomic,strong)NSArray *dataArray;

//2.记录搜索控制器
@property(nonatomic,strong)UISearchController *searchController;

//3.记录显示搜索结果控制器
@property(nonatomic,strong)ShowResultTableViewController *showResultVC;

@end

@implementation MainTableViewController

- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[@"安徽大学",@"天津大学",@"北京大学",@"北京邮电大学",];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建用于展示搜索结果的表vc实例
    self.showResultVC = [[ShowResultTableViewController alloc]init];
    
    //创建搜索控制器实例
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:self.showResultVC];
    
    //设置搜索条相关的属性
    //设置搜索条尺寸为自适应
    [self.searchController.searchBar sizeToFit];
    
    /*//设置搜索条中的分段类别
    self.searchController.searchBar.scopeButtonTitles=@[@"设备",@"软件",@"其它"];
    */
    //将搜索条放到表头视图中
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    //设置搜索控制器的结果更新代理为当前控制器
    //即，只要搜索控制器捕获到了用户的搜索动作
    //则立即给当前控制器发消息，告诉它已经更新
    //需要进行处理
    self.searchController.searchResultsUpdater = self;
    
    //允许在当前界面上切换显示数据的上下文对象
    //即 本来现在显示的MainTVC的表视图，允许
    //切换成 showResultVC的表视图来显示
    self.definesPresentationContext = YES;
    
    // 设置搜索条的代理
    // 捕获到用户点击切换类别按钮
    self.searchController.searchBar.delegate = self;
    
}

#pragma mark - UISeachBarDelegate协议
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    [self updateSearchResultsForSearchController:self.searchController];
}

#pragma mark - UISearchResultUpdating协议
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    //1.获取用户在搜索条中输入的文字
    NSString *searchText = searchController.searchBar.text;
    
    
    
    //3.准备一个空白的数组，存储比对成功匹配
    //后的搜索结果
    NSMutableArray *resultArray = [NSMutableArray array];
    
    //4.遍历dataArray，逐一比对商品名和类别
    for (NSString *p in self.dataArray) {
        //先判断p的name中是否包含输入的文本
        //range包含length location
        //abcdefg 中 cdef 的range
        //length：4  location：2
        NSRange range = [p rangeOfString:searchText];
        if (range.length > 0 ) {
            [resultArray addObject:p];
        }
    }
    //5. 将搜索结果传给负责展示结果的vc
    self.showResultVC.resultData = resultArray;
    
    //6.更新视图显示数据
    [self.showResultVC.tableView reloadData];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCell"];
    }
    cell.textLabel.text  = self.dataArray[indexPath.row];
    
    
    return cell;
}




@end
