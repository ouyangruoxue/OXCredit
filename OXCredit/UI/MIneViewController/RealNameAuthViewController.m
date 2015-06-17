//
//  RealNameAuthViewController.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/16.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "RealNameAuthViewController.h"
#import "myReleaseTableViewCell.h"

@interface RealNameAuthViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *realNameTable;
@property(nonatomic,strong)UITextField *nameTextField;
@property(nonatomic,strong)UITextField *identitycardTextField;
@end

@implementation RealNameAuthViewController


-(void)dealloc{
    _realNameTable = nil;
    _nameTextField = nil;
    _identitycardTextField = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    
    [self.topContainerView addSubview:self.backButton];
    self.titleText  =@"我要发布";
    [self.containerView addSubview:self.realNameTable];
    
    [self createTableFootView];
}


#pragma mark buttonaction
-(void)confirmationAuth{
    
}

-(void)createTableFootView{
    
    UIView *foot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    foot.backgroundColor = [UIColor clearColor];
    
    UIButton *releaseBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 30, 188, 30)];
    [releaseBtn setBackgroundImage:IMGNAMED(@"bind_kuang") forState:UIControlStateNormal];
    [releaseBtn setTitle:@"确定" forState:UIControlStateNormal];
    releaseBtn.titleLabel.font = FONT_TITLE(kFont_Size_14);
    [releaseBtn addTarget:self action:@selector(confirmationAuth) forControlEvents:UIControlEventTouchUpInside];
    releaseBtn.centerX = SCREEN_WIDTH/2;
    [foot addSubview:releaseBtn];
    
    self.realNameTable.tableFooterView = foot;
}


#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 10;
    
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *personalCell = @"myReleaseTableViewCell";
    myReleaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:personalCell];
    if (cell == nil) {
        cell = [[myReleaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personalCell];
    }
    cell.accessoryType = UITableViewCellAccessoryNone;
    NSInteger index = [indexPath row];
    switch (index) {
        case 0:{
            cell.nameLabel.text = @"真实姓名";
            [cell.contentView addSubview:self.nameTextField];
        }
            break;
        case 1:{
            cell.nameLabel.text = @"身份证号";
            [cell.contentView addSubview:self.identitycardTextField];
        }
            break;
        default:
            break;
    }
    
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark get

-(UITextField *)nameTextField{
    
    if (!_nameTextField) {
        _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 0, SCREEN_WIDTH-120, 50)];
        _nameTextField.placeholder = @"请输入姓名";
        _nameTextField.font = FONT_TITLE(kFont_Size_14);
        _nameTextField.backgroundColor = [UIColor clearColor];
    }
    return _nameTextField;
}

-(UITextField *)identitycardTextField{
    
    if (!_identitycardTextField) {
        _identitycardTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 0, SCREEN_WIDTH-120, 50)];
        _identitycardTextField.placeholder = @"请输入身份证号";
        _identitycardTextField.font = FONT_TITLE(kFont_Size_14);
        _identitycardTextField.backgroundColor = [UIColor clearColor];
    }
    return _identitycardTextField;
}



-(UITableView *)realNameTable{
    if (!_realNameTable) {
        _realNameTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.containerView.height) style:UITableViewStylePlain];
        _realNameTable.delegate = self;
        _realNameTable.dataSource = self;
        _realNameTable.backgroundColor = K_BACKGROUND_COLOR;
        _realNameTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _realNameTable.showsHorizontalScrollIndicator = NO;
        _realNameTable.showsVerticalScrollIndicator = NO;
        _realNameTable.bounces = NO;
        [self createTableFootView];
    }
    return _realNameTable;
}

@end
