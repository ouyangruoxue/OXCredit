//
//  SecuritySetViewController.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "SecuritySetViewController.h"
#import "PersonalTableViewCell.h"
#import "BindMobileViewController.h"
#import "BindEmailViewController.h"
@interface SecuritySetViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *setTable;
@end

@implementation SecuritySetViewController
-(void)dealloc{
    _setTable = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)initUI{
    [self.topContainerView addSubview:self.backButton];
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    self.titleText = @"安全设置";
    [self.containerView addSubview:self.setTable];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
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
    cell.lineView.bottom = 44;
    cell.nameLabel.left = 20;
    cell.accessLabel.textColor = kApp_Corlor_8;
    if (indexPath.row == 0) {
        
        cell.nameLabel.text = @"绑定手机";

        cell.accessLabel.text = @"未绑定";
    }
    else{
        cell.nameLabel.text = @"绑定邮箱";
        
        cell.accessLabel.text = @"未绑定";
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
        if (indexPath.row == 0) {
            BindMobileViewController *bindmobile = [[BindMobileViewController alloc] init];
            [self.navigationController pushViewController:bindmobile animated:YES];
        }
        else{
            BindEmailViewController *bindEmail = [[BindEmailViewController alloc] init];
            [self.navigationController pushViewController:bindEmail animated:YES];
        }
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
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
