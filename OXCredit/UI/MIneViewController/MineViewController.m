//
//  MineViewController.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/5.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "MineViewController.h"
#import "PersonalTableViewCell.h"
#import "MyReleasedProductViewController.h"
#import "MyAccountViewController.h"
#import "PassWordSetViewController.h"
#import "SecuritySetViewController.h"
#import "MyProductViewController.h"
@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *personalTable;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initUI{
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    self.titleText  = @"我";
    [self.containerView addSubview:self.personalTable];
}

#pragma mark buttonAction


-(void)loginOut{
    
    
}

#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0||section == 1||section ==4) {
        return 1;
    }
    else if(section == 2){
        return 4;
    }
    else{
        return 5;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    

    return 10;

}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 60;
    }
    return 0;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        return 70;
    }
    else{
        return 50;
    }
    return 0;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    if (section != 0) {
        return nil;
    }
    
    UIView *bottomview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    [bottomview setBackgroundColor:K_BACKGROUND_COLOR];
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 50)];
    headView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e98f8f"];
    
   UILabel *balance = [[UILabel alloc] init];
    balance.backgroundColor = [UIColor clearColor];
    balance.textAlignment = NSTextAlignmentCenter;
    balance.textColor = kApp_Corlor_1;
    balance.font = BOLDFONT_TITLE(kFont_Size_2);
    balance.width = SCREEN_WIDTH/3;
    balance.height  = 20;
    balance.text = @"0.00";
    balance.top = 10;
    balance.centerX = SCREEN_WIDTH/6;
    [headView addSubview:balance];
    
    UILabel *balanceTitle = [[UILabel alloc] init];
    balanceTitle.numberOfLines = 0;
    balanceTitle.backgroundColor = [UIColor clearColor];
    balanceTitle.textAlignment = NSTextAlignmentCenter;
    balanceTitle.textColor = kApp_Corlor_1;
    balanceTitle.font = BOLDFONT_TITLE(kFont_Size_5);
    balanceTitle.width = SCREEN_WIDTH/3;
    balanceTitle.height  = 20;
    balanceTitle.text = @"余额（元）";
    balanceTitle.top = balance.bottom;
    balanceTitle.centerX = SCREEN_WIDTH/6;
    [headView addSubview:balanceTitle];

    //不可变现余额
    UILabel *staticBalance = [[UILabel alloc] init];
    staticBalance.backgroundColor = [UIColor clearColor];
    staticBalance.textAlignment = NSTextAlignmentCenter;
    staticBalance.textColor = kApp_Corlor_1;
    staticBalance.font = BOLDFONT_TITLE(kFont_Size_2);
    staticBalance.width = SCREEN_WIDTH/3;
    staticBalance.height  = 20;
    staticBalance.text = @"0.00";
    staticBalance.top = 10;
    staticBalance.centerX = SCREEN_WIDTH/2;
    [headView addSubview:staticBalance];
    
    UILabel *staticBalanceTitle = [[UILabel alloc] init];
    staticBalanceTitle.backgroundColor = [UIColor clearColor];
    staticBalanceTitle.textAlignment = NSTextAlignmentCenter;
    staticBalanceTitle.textColor = kApp_Corlor_1;
    staticBalanceTitle.font = BOLDFONT_TITLE(kFont_Size_5);
    staticBalanceTitle.width = SCREEN_WIDTH/3;
    staticBalanceTitle.height  = 20;
    staticBalanceTitle.text = @"不可变现余额（元）";
    staticBalanceTitle.top = staticBalance.bottom;
    staticBalanceTitle.centerX = SCREEN_WIDTH/2;
    [headView addSubview:staticBalanceTitle];

    //积分
    UILabel *pointsBalance = [[UILabel alloc] init];
    pointsBalance.backgroundColor = [UIColor clearColor];
    pointsBalance.textAlignment = NSTextAlignmentCenter;
    pointsBalance.textColor = kApp_Corlor_1;
    pointsBalance.font = BOLDFONT_TITLE(kFont_Size_2);
    pointsBalance.width = SCREEN_WIDTH/3;
    pointsBalance.height  = 20;
    pointsBalance.text = @"0.00";
    pointsBalance.top = 10;
    pointsBalance.centerX = (SCREEN_WIDTH/6)*5;
    [headView addSubview:pointsBalance];
    
    UILabel *pointsBalanceTitle = [[UILabel alloc] init];
    pointsBalanceTitle.backgroundColor = [UIColor clearColor];
    pointsBalanceTitle.textAlignment = NSTextAlignmentCenter;
    pointsBalanceTitle.textColor = kApp_Corlor_1;
    pointsBalanceTitle.font = BOLDFONT_TITLE(kFont_Size_5);
    pointsBalanceTitle.width = SCREEN_WIDTH/3;
    pointsBalanceTitle.height  = 20;
    pointsBalanceTitle.text = @"积分余额（元）";
    pointsBalanceTitle.top = balance.bottom;
    pointsBalanceTitle.centerX = (SCREEN_WIDTH/6)*5;
    [headView addSubview:pointsBalanceTitle];

    
    UIView *lineview1 = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/3, 10, 1, 30)];
    lineview1.backgroundColor = [PUUtil getColorByHexadecimalColor:@"b17171"];
    [headView addSubview:lineview1];
    
    
    UIView *lineview2 = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/3*2, 10, 1, 30)];
    lineview2.backgroundColor = [PUUtil getColorByHexadecimalColor:@"b17171"];
    [headView addSubview:lineview2];
    
    [bottomview addSubview:headView];
    
    return bottomview;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        
    }
    else if(indexPath.section == 1){
        MyAccountViewController *myaccount = [[MyAccountViewController alloc] init];
        [self.navigationController pushViewController:myaccount animated:YES];
    }
    else if(indexPath.section == 2){
        NSInteger index = [indexPath row];
        switch (index) {
            case 0:{
                SecuritySetViewController *security = [[SecuritySetViewController alloc] init];
                [self.navigationController pushViewController:security animated:YES];
            }
                break;
            case 1:{
                PassWordSetViewController *passwordset = [[PassWordSetViewController alloc] init];
                [self.navigationController pushViewController:passwordset animated:YES];
            }
                
                break;
                
            case 2:{
                
            }
                
                break;
            case 3:{
                
            }
                
                break;
            default:
                break;
        }

    }
    else if(indexPath.section == 3){
        if (indexPath.row == 0) {
            MyProductViewController *Project = [[MyProductViewController alloc] init];
            [self.navigationController pushViewController:Project animated:YES];
        }
    }
}


#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *personalCell = @"PersonalTableViewCell";
    PersonalTableViewCell *cell = nil;
    if (cell == nil) {
        cell = [[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personalCell];
        cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.lineView.hidden = NO;
    cell.iconImage.centerY = 25;
    cell.lineView.left = 65;
    cell.lineView.width = SCREEN_WIDTH -65;
    if (indexPath.section == 0) {
        
        cell.iconImage.width = 50;
        cell.iconImage.height = 50;
        cell.iconImage.centerY = 35;
        cell.iconImage.backgroundColor = [UIColor redColor];
        cell.iconImage.layer.cornerRadius = 25;
        cell.iconImage.layer.masksToBounds = YES;
        
        cell.nameLabel.text = @"18551718588";
        cell.nameLabel.font = FONT_TITLE(kFont_Size_2);
        cell.nameLabel.textColor = [PUUtil getColorByHexadecimalColor:@"4b4b4b"];
        [cell.nameLabel sizeToFit];
        cell.nameLabel.left = cell.iconImage.right+15;
        cell.nameLabel.centerY = 35;
        cell.lineView.hidden = NO;
        cell.lineView.width =SCREEN_WIDTH;
        cell.lineView.left = 0;
        cell.lineView.top = 69.5;
    }
    else if (indexPath.section == 1){
        
        cell.iconImage.image = [UIImage imageNamed:@"my_account"];
        cell.nameLabel.text = @"我的账户";
        cell.lineView.width =SCREEN_WIDTH;
        cell.lineView.left = 0;

    }
    else if (indexPath.section == 2){
    
        NSInteger index = [indexPath row];
        switch (index) {
            case 0:{
                cell.iconImage.image = [UIImage imageNamed:@"security_settings"];
                cell.nameLabel.text = @"安全设置";
            }
                break;
            case 1:{
                cell.iconImage.image = [UIImage imageNamed:@"password_management"];
                cell.nameLabel.text = @"密码管理";

            }
                
                break;
                
            case 2:{
                cell.iconImage.image = [UIImage imageNamed:@"user_authentication"];
                cell.nameLabel.text = @"用户认证";
                
            }
                
                break;
            case 3:{
                cell.iconImage.image = [UIImage imageNamed:@"bank_card_authentication"];
                cell.nameLabel.text = @"银行卡认证";
                cell.lineView.width =SCREEN_WIDTH;
                cell.lineView.left = 0;

            }
                
                break;
            default:
                break;
        }

    }
    else if(indexPath.section == 3){
        cell.lineView.hidden = NO;
        NSInteger index = [indexPath row];
        switch (index) {
            case 0:{
                cell.iconImage.image = [UIImage imageNamed:@"my_product"];
                cell.nameLabel.text = @"我的产品";
            }
                break;
            case 1:{
                cell.iconImage.image = [UIImage imageNamed:@"the_order_center"];
                cell.nameLabel.text = @"订单中心";
            }
                
                break;
                
            case 2:{
                cell.iconImage.image = [UIImage imageNamed:@"integral_center"];
                cell.nameLabel.text = @"积分中心";
                
            }
                
                break;
            case 3:{
                cell.iconImage.image = [UIImage imageNamed:@"my_collection"];
                cell.nameLabel.text = @"我的收藏";
            }
                
                break;
            default:
                break;
        }
        
    }
    else if (indexPath.section == 4){
        cell.iconImage.hidden = YES;
        cell.nameLabel.text = @"退出登录";
        cell.nameLabel.font = FONT_TITLE(kFont_Size_2);
        cell.nameLabel.textColor = [PUUtil getColorByHexadecimalColor:@"df3d3e"];
        [cell.nameLabel sizeToFit];
        cell.nameLabel.centerX = SCREEN_WIDTH/2;
        cell.nameLabel.centerY = 25;
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.lineView.width =SCREEN_WIDTH;
        cell.lineView.left = 0;
    }
    return cell;
    
}




#pragma mark get --

-(UITableView *)personalTable{
    if (!_personalTable) {
        _personalTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.containerView.height-KTABBARHEIGHT) style:UITableViewStylePlain];
        _personalTable.delegate = self;
        _personalTable.dataSource = self;
        _personalTable.backgroundColor = K_BACKGROUND_COLOR;
        _personalTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _personalTable.showsHorizontalScrollIndicator = NO;
        _personalTable.showsVerticalScrollIndicator = NO;
        _personalTable.bounces = YES;
    }
    return _personalTable;
}

@end
