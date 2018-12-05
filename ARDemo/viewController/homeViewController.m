//
//  homeViewController.m
//  ARDemo
//
//  Created by 吴卓荣 on 2018/11/30.
//  Copyright © 2018年 Qcloud. All rights reserved.
//

#import "homeViewController.h"

#import "SystemARDemoViewController.h"
#import "FireViewController.h"
#import "newRedEnvelopeViewController.h"
#import "openRedEnvelopeViewController.h"

@interface homeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation homeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ARDemo";
    [self setUpSubView];
    // Do any additional setup after loading the view from its nib.
}

- (void)setUpSubView
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - TableView Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *titleArray = @[@"系统飞机Demo", @"简单动画创建", @"点击创建随机红包", @"点击领取红包", @"AR"];
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = titleArray[indexPath.row];
    
    return cell;
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:{
            SystemARDemoViewController *viewController = [SystemARDemoViewController new];
            [self.navigationController pushViewController:viewController animated:YES];
            break;
        }
        case 1:{
            FireViewController *viewController = [FireViewController new];
            [self.navigationController pushViewController:viewController animated:YES];
            break;
        }
        case 2:{
            newRedEnvelopeViewController *viewController = [newRedEnvelopeViewController new];
            [self.navigationController pushViewController:viewController animated:YES];
            break;
        }
        case 3:{
            openRedEnvelopeViewController *viewController = [openRedEnvelopeViewController new];
            [self.navigationController pushViewController:viewController animated:YES];
            break;
        }
        default:
            break;
    }
}

@end
