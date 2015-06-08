//
//  MineViewController.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/5.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "MineViewController.h"
#import "PersonalTableViewCell.h"

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
    if (section == 0||section == 1||section==2||section ==4) {
        return 1;
    }
    else{
        return 5;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    

    return 10;

}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        return 90;
    }
    else{
        return 50;
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *personalCell = @"PersonalTableViewCell";
    PersonalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:personalCell];
    if (cell == nil) {
        cell = [[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personalCell];
        cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.lineView.hidden = YES;
    if (indexPath.section == 0) {
        
        cell.iconImage.width = 70;
        cell.iconImage.height = 70;
        cell.iconImage.left = 15;
        cell.iconImage.centerY = 45;
        cell.iconImage.backgroundColor = [UIColor redColor];
        cell.iconImage.layer.cornerRadius = 35;
        cell.iconImage.layer.masksToBounds = YES;
        
        cell.nameLabel.text = @"18551718588";
        cell.nameLabel.font = FONT_TITLE(kFont_Size_2);
        cell.nameLabel.textColor = [PUUtil getColorByHexadecimalColor:@"646464"];
        [cell.nameLabel sizeToFit];
        cell.nameLabel.left = cell.iconImage.right+15;
        cell.nameLabel.centerY = 45;
    }
    else if (indexPath.section == 1){
        
        cell.iconImage.image = [UIImage imageNamed:@"my_account"];
        cell.nameLabel.text = @"我的账户";

    }
    else if (indexPath.section == 2){
        cell.iconImage.image = [UIImage imageNamed:@"news"];
        cell.nameLabel.text = @"消息";

    }
    else if(indexPath.section == 3){
        cell.lineView.hidden = NO;
        NSInteger index = [indexPath row];
        switch (index) {
            case 0:{
                cell.iconImage.image = [UIImage imageNamed:@"I_released_project"];
                cell.nameLabel.text = @"我发布的项目";
                cell.accessLabel.text = @"0";
            }
                break;
            case 1:{
                cell.iconImage.image = [UIImage imageNamed:@"invest_project"];
                cell.nameLabel.text = @"我投资的项目";
                cell.accessLabel.text = @"0";
            }
                
                break;
                
            case 2:{
                cell.iconImage.image = [UIImage imageNamed:@"I_appointment_project"];
                cell.nameLabel.text = @"我预约的项目";
                cell.accessLabel.text = @"0";
                
            }
                
                break;
            case 3:{
                cell.iconImage.image = [UIImage imageNamed:@"interviewed_project"];
                cell.nameLabel.text = @"我约谈的项目";
                cell.accessLabel.text = @"0";
            }
                
                break;
            case 4:{
                cell.iconImage.image = [UIImage imageNamed:@"I_attention_project"];
                cell.nameLabel.text = @"我关注的项目";
                cell.accessLabel.text = @"0";
            }
                
                break;
                
            default:
                break;
        }
        
    }
    else if (indexPath.section == 4){
        cell.nameLabel.text = @"退出登录";
        cell.nameLabel.font = FONT_TITLE(kFont_Size_2);
        cell.nameLabel.textColor = [PUUtil getColorByHexadecimalColor:@"df3d3e"];
        [cell.nameLabel sizeToFit];
        cell.nameLabel.centerX = SCREEN_WIDTH/2;
        cell.nameLabel.centerY = 25;
        cell.accessoryType = UITableViewCellAccessoryNone;
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
        _personalTable.bounces = NO;
    }
    return _personalTable;
}

@end
