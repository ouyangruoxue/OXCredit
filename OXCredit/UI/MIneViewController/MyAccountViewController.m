//
//  MyAccountViewController.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/10.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "MyAccountViewController.h"
#import "ChooseAccountRecordTypeView.h"
#import "MyAccountRecordTableViewCell.h"
@interface MyAccountViewController ()<ChooseTypeDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIButton *titleBtn;
@property(nonatomic,strong)ChooseAccountRecordTypeView *chooseTypeView;
@property(nonatomic,strong)UITableView *accountRecordTable;
@end

@implementation MyAccountViewController

-(void)dealloc{
    _accountRecordTable = nil;
    _chooseTypeView = nil;
    _titleBtn = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    
}

-(void)initUI{

    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    [self.topContainerView addSubview:self.backButton];
    [self setNavTitleWithTitle:@"提现"];
    [self.containerView addSubview:self.chooseTypeView];
    [self.view bringSubviewToFront:self.topImageView];
    [self.containerView addSubview:self.accountRecordTable];
    if (IOS7_OR_LATER) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [self createBottomView];
    [self.containerView addSubview:self.chooseTypeView];
    [self.view bringSubviewToFront:self.topImageView];
}
#pragma  mark buttonAction
-(void)chooseRecordType{
    
    if (_chooseTypeView.hidden) {
        _chooseTypeView.hidden = NO;
        [UIView animateWithDuration:0.5 animations:^{
            _chooseTypeView.frame = CGRectMake(SCREEN_WIDTH/2-40, 0, 80, 112);
        } completion:^(BOOL finished) {
            
        }];
    }
    else{
        [UIView animateWithDuration:0.5 animations:^{
            _chooseTypeView.frame = CGRectMake(SCREEN_WIDTH/2-40, -214, 80, 112);
        } completion:^(BOOL finished) {
            _chooseTypeView.hidden = YES;
        }];

    }
    
}
//提现
-(void)drawMoney{

    
}

//充值
-(void)recharge{
    
    
}


#pragma chooseTypeDelegate
-(void)didSelectWithDic:(NSString *)type{
    
    [self setNavTitleWithTitle:type];
    [self chooseRecordType];
}

#pragma mark aboutchooseliveroom
-(void)setNavTitleWithTitle:(NSString *)title {
    
    if (!_titleBtn) {
        _titleBtn = [[UIButton alloc] init];
        [_titleBtn setBackgroundColor:[UIColor clearColor]];
        [_titleBtn setImage:[UIImage imageNamed:@"liveRoom_arrow_down_ic"] forState:UIControlStateNormal];
        //        [_titleBtn setImage:[UIImage imageNamed:@"liveRoom_arrow_down_ic_1"] forState:UIControlStateHighlighted];
        _titleBtn.titleLabel.font = [UIFont boldSystemFontOfSize:kFont_Size_1];
        [_titleBtn setTitleColor:kApp_Corlor_1 forState:UIControlStateHighlighted];
        [_titleBtn addTarget:self action:@selector(chooseRecordType) forControlEvents:UIControlEventTouchUpInside];
        _titleBtn.titleLabel.textColor = kApp_Corlor_1;
        [self.topContainerView addSubview:_titleBtn];
    }
    
    if (title) {
        [_titleBtn setTitle:title forState:UIControlStateNormal];
        CGSize temp = CGSizeMake(220, 1000);
        
        CGRect txtSize = [title boundingRectWithSize:temp options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:kFont_Size_1],NSFontAttributeName,kApp_Corlor_1,NSForegroundColorAttributeName,nil] context:nil];
        _titleBtn.width = txtSize.size.width+20;
        _titleBtn.height = 50;
        _titleBtn.centerX = self.topContainerView.width/2;
        _titleBtn.centerY = self.topContainerView.height/2;
        _titleBtn.imageEdgeInsets = UIEdgeInsetsMake(5, _titleBtn.width-5, 5, 0);
        _titleBtn.titleEdgeInsets = UIEdgeInsetsMake(5, 0, 5, 10);
    }
    
}

-(void)createBottomView{
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, self.containerView.height-49, SCREEN_WIDTH, 49)];
    backgroundView.backgroundColor = kApp_Corlor_1;
    
    UIView  *topLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1)];
    topLineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"f7f7f7"];
    [backgroundView addSubview:topLineView];
    
    UIButton *drawMoneyBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/2,49 )];
    [drawMoneyBtn setTitle:@"提现" forState:UIControlStateNormal];
    drawMoneyBtn.titleLabel.font = FONT_TITLE(kFont_Size_2);
    [drawMoneyBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"3e2eb6"] forState:UIControlStateNormal];
    [drawMoneyBtn setBackgroundColor:[UIColor clearColor]];
    [drawMoneyBtn addTarget:self action:@selector(drawMoney) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:drawMoneyBtn];
    
    
    
    UIButton *rechargeBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2,49 )];
    [rechargeBtn setTitle:@"充值" forState:UIControlStateNormal];
    rechargeBtn.titleLabel.font = FONT_TITLE(kFont_Size_2);
    [rechargeBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"3e2eb6"] forState:UIControlStateNormal];
    [rechargeBtn setBackgroundColor:[UIColor clearColor]];
    [rechargeBtn addTarget:self action:@selector(recharge) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:rechargeBtn];

    
    UIView  *centerLineView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-1, 5, 1, 40)];
    centerLineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e0e0e0"];
    [backgroundView addSubview:centerLineView];
    
    [self.containerView addSubview:backgroundView];
    
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *playByPlayTableViewCell = @"MyAccountRecordTableViewCell";
    MyAccountRecordTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:playByPlayTableViewCell];
    if (cell == nil) {
        cell = [[MyAccountRecordTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:playByPlayTableViewCell];
    }
    
    if (indexPath.row%2) {
        cell.recordTypeLabel.textColor = [PUUtil getColorByHexadecimalColor:@"4b4b4b"];
        cell.amountLabel.textColor = [PUUtil getColorByHexadecimalColor:@"4b4b4b"];
        cell.timeLabel.textColor = [PUUtil getColorByHexadecimalColor:@"4b4b4b"];
    }
    else{
        cell.recordTypeLabel.textColor = [PUUtil getColorByHexadecimalColor:@"ff6600"];
        cell.amountLabel.textColor = [PUUtil getColorByHexadecimalColor:@"ff6600"];
        cell.timeLabel.textColor = [PUUtil getColorByHexadecimalColor:@"ff6600"];

    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark get-

-(ChooseAccountRecordTypeView *)chooseTypeView{
    
    if (!_chooseTypeView) {
        _chooseTypeView = [[ChooseAccountRecordTypeView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-40, -112, 80, 112) withArr:nil withType:myAccountType];
        _chooseTypeView.hidden = YES;
        _chooseTypeView.backgroundColor = [UIColor clearColor];
        _chooseTypeView.chooseDelegate = self;
    }
    return _chooseTypeView;
}

-(UITableView *)accountRecordTable{
    if (!_accountRecordTable) {
        _accountRecordTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.containerView.height-KTABBARHEIGHT) style:UITableViewStylePlain];
        _accountRecordTable.delegate = self;
        _accountRecordTable.dataSource = self;
        _accountRecordTable.backgroundColor = K_BACKGROUND_COLOR;
        _accountRecordTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _accountRecordTable.showsHorizontalScrollIndicator = NO;
        _accountRecordTable.showsVerticalScrollIndicator = NO;
        _accountRecordTable.bounces = YES;
    }
    return _accountRecordTable;
}


@end
