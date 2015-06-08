//
//  MoreViewController.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/5.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "MoreViewController.h"
#import "MoreTableViewCell.h"
@interface MoreViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *moreTable;
@end

@implementation MoreViewController
-(void)dealloc{
    _moreTable = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    self.titleText  = @"更多";
    [self.containerView addSubview:self.moreTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 4;
    }
    return 3;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 20;
    
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *personalCell = @"MoreTableViewCell";
    MoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:personalCell];
    if (cell == nil) {
        cell = [[MoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personalCell];
        cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.font = FONT_TITLE(kFont_Size_2);
    cell.textLabel.textColor = [PUUtil getColorByHexadecimalColor:@"4b4b4b"];
    if (indexPath.section == 0){
        NSInteger row = indexPath.row;
        switch (row) {
            case 0:{
                cell.textLabel.text = @"服务公告";
            }
                break;
            case 1:{
                cell.textLabel.text = @"帮助中心";
            }
                break;
            case 2:{
                cell.textLabel.text = @"关于我们";
            }
                break;
            case 3:{
                cell.textLabel.text = @"客服电话";
                UILabel * label = [[UILabel alloc] init];
                label.textColor = [PUUtil getColorByHexadecimalColor:@"646464"];
                label.font = FONT_TITLE(kFont_Size_2);
                label.backgroundColor = [UIColor clearColor];
                label.text = @"400-0088-200";
                
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                [label sizeToFit];
                cell.accessoryView = label;

                cell.lineView.width =SCREEN_WIDTH;
                cell.lineView.left = 0;
            }
                break;
 
            default:
                break;
        }
    }
    else{
        NSInteger row = indexPath.row;
        switch (row) {
            case 0:{
                cell.textLabel.text = @"应用评分";
            }
                break;
            case 1:{
                cell.textLabel.text = @"意见反馈";
            }
                break;
            case 2:{
                cell.textLabel.text = @"分享";
                cell.lineView.width =SCREEN_WIDTH;
                cell.lineView.left = 0;
            }
                break;
                
            default:
                break;
        }
    }
    return cell;
    
}


#pragma mark get --

-(UITableView *)moreTable{
    if (!_moreTable) {
        _moreTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.containerView.height-KTABBARHEIGHT) style:UITableViewStylePlain];
        _moreTable.delegate = self;
        _moreTable.dataSource = self;
        _moreTable.backgroundColor = K_BACKGROUND_COLOR;
        _moreTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _moreTable.showsHorizontalScrollIndicator = NO;
        _moreTable.showsVerticalScrollIndicator = NO;
        _moreTable.tableFooterView = [[UIView alloc] init];
        _moreTable.bounces = NO;
    }
    return _moreTable;
}

@end
