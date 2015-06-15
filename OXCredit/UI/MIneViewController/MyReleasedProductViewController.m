//
//  MyReleasedProjectViewController.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/9.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "MyReleasedProductViewController.h"
#import "myReleaseTableViewCell.h"

@interface MyReleasedProductViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *myProjectTable;
@property(nonatomic,strong)UITextField *productTitle;
@property(nonatomic,strong)UITextField *startPeople;
@property(nonatomic,strong)UITextField *raiseAmount;//筹集金额
@property(nonatomic,strong)UITextView *productDetailInfo;
@property(nonatomic,strong)UILabel    *productTime;
@property(nonatomic,strong)UIDatePicker *datePick;
@property(nonatomic,strong)UIView *pickHeaderView;
@property(nonatomic,strong)UIView      *pickbottomView;
@end

@implementation MyReleasedProductViewController

-(void)dealloc{
    _myProjectTable = nil;
    _productTitle = nil;
    _raiseAmount = nil;
    _productDetailInfo = nil;
    _productTime = nil;
    _datePick = nil;
    _pickbottomView = nil;
    _pickHeaderView = nil;
    _startPeople = nil;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    
    [self.topContainerView addSubview:self.backButton];
    self.titleText  =@"我要发布";
    [self.containerView addSubview:self.myProjectTable];
    

    
    _pickbottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.containerView.height)];
    _pickbottomView.hidden = YES;
    _pickbottomView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.4];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelChoosePickView)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [_pickbottomView addGestureRecognizer:tapGesture];
    [_pickbottomView addSubview:self.datePick];
    [_pickbottomView addSubview:self.pickHeaderView];
    
    [self.containerView addSubview:_pickbottomView];
    
    [self createTableFootView];
}

#pragma mark btn action
//发布
-(void)confirmationBind{
    
}


-(void)chooseTime{
    _pickbottomView.hidden = NO;

        _pickHeaderView.top = SCREEN_HEIGHT-self.topImageView.height;
        [UIView animateWithDuration:0.3
                         animations:^{
                             _datePick.frame = CGRectMake(0,SCREEN_HEIGHT-216-self.topImageView.height, 0, 0);
                             _pickHeaderView.top = _datePick.top -40;
                         } completion:^(BOOL finished) {
                             
                         }];
        
        
}


-(void)cancelChoosePickView{
    
    _pickbottomView.hidden = YES;
    [UIView animateWithDuration:0.3
                     animations:^{
                         _datePick.frame = CGRectMake(0,SCREEN_HEIGHT-self.topImageView.height, 0, 0);
                         _pickHeaderView.top = _datePick.top;
                     } completion:^(BOOL finished) {
                         
                     }];
    
    
}

-(void)chooseSexComplete{
    
    _pickbottomView.hidden = YES;
        [UIView animateWithDuration:0.3
                         animations:^{
                             _datePick.frame = CGRectMake(0,SCREEN_HEIGHT-self.topImageView.height, 0, 0);
                             _pickHeaderView.top = _datePick.top;
                         } completion:^(BOOL finished) {
                             NSDateFormatter * timeFormatter = [[NSDateFormatter alloc] init];
                             [timeFormatter setDateFormat:@"yyyy年MM月dd日"];
                             _productTime.text = [timeFormatter stringFromDate:_datePick.date];
                             [_myProjectTable reloadData];
                         }];
    
    
}


-(void)createTableFootView{
    
    UIView *foot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    foot.backgroundColor = [UIColor clearColor];
    
   UIButton *releaseBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 30, 188, 30)];
    [releaseBtn setBackgroundImage:IMGNAMED(@"bind_kuang") forState:UIControlStateNormal];
    [releaseBtn setTitle:@"发布" forState:UIControlStateNormal];
    releaseBtn.titleLabel.font = FONT_TITLE(kFont_Size_14);
    [releaseBtn addTarget:self action:@selector(confirmationBind) forControlEvents:UIControlEventTouchUpInside];
    releaseBtn.centerX = SCREEN_WIDTH/2;
    [foot addSubview:releaseBtn];
    
    self.myProjectTable.tableFooterView = foot;
}


#pragma mark TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return 5;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return 10;
    
}
-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 3) {
        return 85;
    }
        return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 4) {
        [self chooseTime];
    }
}


#pragma mark tableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *personalCell = @"myReleaseTableViewCell";
    myReleaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:personalCell];
    if (cell == nil) {
        cell = [[myReleaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:personalCell];
    }
    
    NSInteger index = [indexPath row];
    switch (index) {
        case 0:{
            cell.nameLabel.text = @"项目名称";
            [cell.contentView addSubview:self.productTitle];
        }
            break;
        case 1:{
            cell.nameLabel.text = @"发起人";
            [cell.contentView addSubview:self.startPeople];
        }
            
            break;
            
        case 2:{
            cell.nameLabel.text = @"筹集金额";
            [cell.contentView addSubview:self.raiseAmount];
        }
            
            break;
        case 3:{
            cell.nameLabel.text = @"项目简介";
            [cell.contentView addSubview:self.productDetailInfo];
        }
            
            break;
        case 4:{
            cell.nameLabel.text = @"项目时间";
            [cell.contentView addSubview:self.productTime];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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

#pragma mark get --

-(UITextField *)productTitle{
    
    if (!_productTitle) {
        _productTitle = [[UITextField alloc] initWithFrame:CGRectMake(100, 0, SCREEN_WIDTH-120, 50)];
        _productTitle.placeholder = @"请输入项目名称";
        _productTitle.font = FONT_TITLE(kFont_Size_14);
        _productTitle.backgroundColor = [UIColor clearColor];
    }
    return _productTitle;
}

-(UITextField *)startPeople{
    
    if (!_startPeople) {
        _startPeople = [[UITextField alloc] initWithFrame:CGRectMake(100, 0, SCREEN_WIDTH-120, 50)];
        _startPeople.placeholder = @"请输入发起人";
        _startPeople.font = FONT_TITLE(kFont_Size_14);
        _startPeople.backgroundColor = [UIColor clearColor];
    }
    return _startPeople;
}

-(UITextField *)raiseAmount{
    
    if (!_raiseAmount) {
        _raiseAmount = [[UITextField alloc] initWithFrame:CGRectMake(100, 0, SCREEN_WIDTH-120, 50)];
        _raiseAmount.placeholder = @"请输入筹集金额";
        _raiseAmount.font = FONT_TITLE(kFont_Size_14);
        _raiseAmount.backgroundColor = [UIColor clearColor];
    }
    return _raiseAmount;
}

-(UILabel *)productTime{
    
    if (!_productTime) {
        _productTime = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, SCREEN_WIDTH-120, 50)];
        _productTime.font = FONT_TITLE(kFont_Size_14);
        _productTime.backgroundColor = [UIColor clearColor];
    }
    return _productTime;
}


-(UITextView *)productDetailInfo{
    
    if (!_productDetailInfo) {
        _productDetailInfo = [[UITextView alloc] initWithFrame:CGRectMake(100, 0, SCREEN_WIDTH-120, 80)];

        _productDetailInfo.font = FONT_TITLE(kFont_Size_14);
        _productDetailInfo.backgroundColor = [UIColor clearColor];
    }
    return _productDetailInfo;
}




-(UITableView *)myProjectTable{
    if (!_myProjectTable) {
        _myProjectTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.containerView.height) style:UITableViewStylePlain];
        _myProjectTable.delegate = self;
        _myProjectTable.dataSource = self;
        _myProjectTable.backgroundColor = K_BACKGROUND_COLOR;
        _myProjectTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _myProjectTable.showsHorizontalScrollIndicator = NO;
        _myProjectTable.showsVerticalScrollIndicator = NO;
        _myProjectTable.bounces = NO;
    }
    return _myProjectTable;
}

-(UIView *)pickHeaderView{
    
    if (!_pickHeaderView) {
        
        _pickHeaderView  = [[UIView alloc] initWithFrame:CGRectMake(0, self.datePick.top, SCREEN_WIDTH, 40)];
        
        _pickHeaderView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"f0f1f2"];
        UIButton *completeBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, 0, 60, 40)];
        completeBtn.backgroundColor = [UIColor clearColor];
        [completeBtn setTitleColor:kApp_Corlor_5 forState:UIControlStateNormal];
        [completeBtn setTitle:@"完成" forState:UIControlStateNormal];
        completeBtn.titleLabel.font = FONT_TITLE(kFont_Size_3);
        [completeBtn addTarget:self action:@selector(chooseSexComplete) forControlEvents:UIControlEventAllEvents];
        
        
        UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
        cancelBtn.backgroundColor = [UIColor clearColor];
        [cancelBtn setTitleColor:kApp_Corlor_5 forState:UIControlStateNormal];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        cancelBtn.titleLabel.font = FONT_TITLE(kFont_Size_3);
        [cancelBtn addTarget:self action:@selector(cancelChoosePickView) forControlEvents:UIControlEventAllEvents];
        
        [_pickHeaderView addSubview:cancelBtn];
        
        
        [_pickHeaderView addSubview:completeBtn];
    }
    return _pickHeaderView;
}


-(UIDatePicker *)datePick{
    
    if (!_datePick) {
        _datePick = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-self.topImageView.height, SCREEN_WIDTH, 216)];
        // 设置时区
        [_datePick setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
        // 设置当前显示时间
        [_datePick setDate:[NSDate date] animated:YES];
        // 设置显示最大时间（此处为当前时间）
        [_datePick setMaximumDate:[NSDate date]];
        // 设置UIDatePicker的显示模式
        [_datePick setDatePickerMode:UIDatePickerModeDate];
        // 当值发生改变的时候调用的方法
    }
    return _datePick;
}

@end
