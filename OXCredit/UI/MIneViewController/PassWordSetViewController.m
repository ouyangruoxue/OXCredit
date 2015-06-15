//
//  PassWordSetViewController.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "PassWordSetViewController.h"
#import "PersonalTableViewCell.h"
#import "DealPassWordSetViewController.h"
@interface PassWordSetViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *setTable;
@end

@implementation PassWordSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    [self.topContainerView addSubview:self.backButton];
    self.titleText = @"密码设置";
    [self.containerView addSubview:self.setTable];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *playByPlayTableViewCell = @"PersonalTableViewCell";
    PersonalTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:playByPlayTableViewCell];
    if (cell == nil) {
        cell = [[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:playByPlayTableViewCell];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.nameLabel.left = 20;
    
    if (indexPath.row == 0) {
        cell.nameLabel.text = @"登陆密码";
        
        cell.accessLabel.text = @"未设置";
    }
    else if (indexPath.row == 1){
        cell.nameLabel.text = @"交易密码";
        
        cell.accessLabel.text = @"未设置";

        
    }
    else{
        cell.nameLabel.text = @"手势密码";
        
        cell.accessLabel.text = @"未设置";
    }

    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.row == 0) {
    }
    else if (indexPath.row == 1){
        DealPassWordSetViewController *dealpassword = [[DealPassWordSetViewController alloc] init];
        [self.navigationController pushViewController:dealpassword animated:YES];
    }
    else{
    }
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}


#pragma mark get--


-(UITableView *)setTable{
    if (!_setTable) {
        _setTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.containerView.height) style:UITableViewStylePlain];
        _setTable.delegate = self;
        _setTable.dataSource = self;
        _setTable.backgroundColor = K_BACKGROUND_COLOR;
        _setTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _setTable.showsHorizontalScrollIndicator = NO;
        _setTable.showsVerticalScrollIndicator = NO;
        _setTable.bounces = NO;
    }
    return _setTable;
}
@end
