//
//  HelpCenterViewController.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/9.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "HelpCenterViewController.h"
#import "MoreTableViewCell.h"
@interface HelpCenterViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *helpTable;
@end

@implementation HelpCenterViewController
-(void)dealloc{
    _helpTable = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)initUI{
    
    [self.topContainerView addSubview:self.backButton];
    self.titleText = @"帮助中心";
    [self.containerView addSubview:self.helpTable];
}


#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
        return 4;
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
        NSInteger row = indexPath.row;
        switch (row) {
            case 0:{
                cell.textLabel.text = @"关于好利信";
            }
                break;
            case 1:{
                cell.textLabel.text = @"关于客户端";
            }
                break;
            case 2:{
                cell.textLabel.text = @"债券认购、转让";
            }
                break;
            case 3:{
                cell.textLabel.text = @"关于优惠卡";
            }
                break;
                
            default:
                break;
        }
    
        return cell;
    
}


#pragma mark get 
-(UITableView *)helpTable{
    if (!_helpTable) {
        _helpTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.containerView.height) style:UITableViewStylePlain];
        _helpTable.delegate = self;
        _helpTable.dataSource = self;
        _helpTable.backgroundColor = K_BACKGROUND_COLOR;
        _helpTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _helpTable.showsHorizontalScrollIndicator = NO;
        _helpTable.showsVerticalScrollIndicator = NO;
        _helpTable.tableFooterView = [[UIView alloc] init];
        _helpTable.bounces = NO;
    }
    return _helpTable;
}

@end
