//
//  ProjectViewController.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/5.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "ProjectViewController.h"
#import "ProjectTableViewCell.h"
@interface ProjectViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)UITableView *projectTable;

@end

@implementation ProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    self.titleText  = @"项目";
    [self.containerView addSubview:self.projectTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 10;
    
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 90;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *personalCell = @"ProjectTableViewCell";
    ProjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:personalCell];
    if (cell == nil) {
        cell = [[ProjectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personalCell];
        cell.accessoryType =  UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
    
}


#pragma mark get --

-(UITableView *)projectTable{
    if (!_projectTable) {
        _projectTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.containerView.height-KTABBARHEIGHT) style:UITableViewStylePlain];
        _projectTable.delegate = self;
        _projectTable.dataSource = self;
        _projectTable.backgroundColor = K_BACKGROUND_COLOR;
        _projectTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _projectTable.showsHorizontalScrollIndicator = NO;
        _projectTable.showsVerticalScrollIndicator = NO;
        _projectTable.bounces = NO;
    }
    return _projectTable;
}

@end
