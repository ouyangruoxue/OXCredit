//
//  NoticeViewController.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/9.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "NoticeViewController.h"
#import "NoticeTableViewCell.h"
#import "NoticeDetailViewController.h"

@interface NoticeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *noticeTable;
@end

@implementation NoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    
    [self.topContainerView addSubview:self.backButton];
    self.titleText = @"公告";
    [self.containerView addSubview:self.noticeTable];
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
}


#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 117;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NoticeDetailViewController *detail = [[NoticeDetailViewController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
}


#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *personalCell = @"NoticeTableViewCell";
    NoticeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:personalCell];
    if (cell == nil) {
        cell = [[NoticeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personalCell];
    }
    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark get
-(UITableView *)noticeTable{
    if (!_noticeTable) {
        _noticeTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.containerView.height) style:UITableViewStylePlain];
        _noticeTable.delegate = self;
        _noticeTable.dataSource = self;
        _noticeTable.backgroundColor = K_BACKGROUND_COLOR;
        _noticeTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _noticeTable.showsHorizontalScrollIndicator = NO;
        _noticeTable.showsVerticalScrollIndicator = NO;
        _noticeTable.tableFooterView = [[UIView alloc] init];
        _noticeTable.bounces = NO;
    }
    return _noticeTable;
}

@end
