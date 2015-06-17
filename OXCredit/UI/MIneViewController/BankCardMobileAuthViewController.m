//
//  BankCardMobileAuthViewController.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/16.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "BankCardMobileAuthViewController.h"
#import "PersonalTableViewCell.h"
@interface BankCardMobileAuthViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIButton *oKBtn;
@property(nonatomic,strong)UITextField *authTextField;
@property(nonatomic,strong)UITableView *BankCardTable;
@property(nonatomic,strong)NSTimer *resendPasswordTimer;
@property(nonatomic,assign)NSInteger canresendSeconds;
@property(nonatomic,strong)UIButton *getVerificationCodeBtn;

@end

@implementation BankCardMobileAuthViewController

-(void)dealloc{
    _oKBtn = nil;
    _BankCardTable = nil;
    _authTextField = nil;
    if ([_resendPasswordTimer isValid]) {
        [_resendPasswordTimer invalidate];
        _resendPasswordTimer = nil;
    }
    _getVerificationCodeBtn = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self setTimerForResendButton:-1];
}

-(void)initUI{
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    [self.topContainerView addSubview:self.backButton];
    self.titleText = @"银行卡认证";
    [self.containerView addSubview:self.BankCardTable];
    [self.containerView addSubview:self.oKBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setTimerForResendButton:(NSInteger)second {
    
    if([_resendPasswordTimer isValid]){
        [_resendPasswordTimer invalidate];
        _resendPasswordTimer = nil;
    }
    
    //显示重新发送倒计时的定时器
    _resendPasswordTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(ontimer) userInfo:nil repeats:YES];
    if(second == -1){
        _canresendSeconds = 60;
    }else{
        _canresendSeconds = second;
    }
}

- (void)ontimer {
    if (_canresendSeconds >0){
        [_getVerificationCodeBtn setTitle:[NSString stringWithFormat:@"%lds后重发", (long)_canresendSeconds] forState:UIControlStateNormal];
        //_getVerificationCodeBtn.backgroundColor = [PUUtil getColorByHexadecimalColor:@"bbbbbb"];
        [_getVerificationCodeBtn setTitleColor:kApp_Corlor_8 forState:UIControlStateNormal];
        _getVerificationCodeBtn.enabled = NO;
        _canresendSeconds --;
    } else {
        [_getVerificationCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        //_getVerificationCodeBtn.backgroundColor = [PUUtil getColorByHexadecimalColor:@"df3d3e"];
        [_getVerificationCodeBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"ff6600"] forState:UIControlStateNormal];
        _getVerificationCodeBtn.enabled = YES;
        if ([_resendPasswordTimer isValid]) {
            [_resendPasswordTimer invalidate];
            _resendPasswordTimer = nil;
        }
    }
}


#pragma mark buttonAction
-(void)confirmationBind{
    self.BankCardTable.hidden = YES;
    self.oKBtn.hidden = YES;
    UIImageView *successImage = [[UIImageView alloc] initWithImage:IMGNAMED(@"send_a_success")];
    successImage.centerX = SCREEN_WIDTH/2;
    successImage.top = 50;
    [self.containerView addSubview:successImage];
    
    UILabel *alertlabel = [[UILabel alloc] init];
    alertlabel.backgroundColor = [UIColor clearColor];
    alertlabel.top = successImage.bottom +20;
    alertlabel.font = FONT_TITLE(kFont_Size_2);
    alertlabel.textColor = [PUUtil getColorByHexadecimalColor:@"646464"];
    alertlabel.text = @"银行卡添加成功";
    [alertlabel sizeToFit];
    alertlabel.centerX = SCREEN_WIDTH/2;
    [self.containerView addSubview:alertlabel];
    
}

-(void)getVerificationCode{
    
    [self setTimerForResendButton:-1];
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 55;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 55)];
    headView.backgroundColor = [UIColor clearColor];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = FONT_TITLE(kFont_Size_5);
    titleLabel.textColor = [PUUtil getColorByHexadecimalColor:@"646464"];
    titleLabel.text = @"请输入手机号15252338923收到的短信验证码";
    [titleLabel sizeToFit];
    titleLabel.left = 20;
    titleLabel.centerY = 55/2;
    
    [headView addSubview:titleLabel];
    
    return headView;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *playByPlayTableViewCell = @"PersonalTableViewCell";
    PersonalTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:playByPlayTableViewCell];
    if (cell == nil) {
        cell = [[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:playByPlayTableViewCell];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
        cell.toplineView.hidden = NO;
        self.authTextField.left = 20;
        [cell.contentView addSubview:self.authTextField];
    
    [cell.contentView addSubview:self.getVerificationCodeBtn];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(self.getVerificationCodeBtn.left-1, 10, 1, 30)];
    lineView.backgroundColor =[PUUtil getColorByHexadecimalColor:@"e0e0e0"];
    [cell.contentView addSubview:lineView];
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

#pragma mark get--



-(UIButton *)oKBtn{
    if (!_oKBtn) {
        _oKBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 135, 188, 30)];
        [_oKBtn setBackgroundImage:IMGNAMED(@"bind_kuang") forState:UIControlStateNormal];
        [_oKBtn setTitle:@"下一步" forState:UIControlStateNormal];
        _oKBtn.titleLabel.font = FONT_TITLE(kFont_Size_14);
        [_oKBtn addTarget:self action:@selector(confirmationBind) forControlEvents:UIControlEventTouchUpInside];
        _oKBtn.centerX = SCREEN_WIDTH/2;
    }
    return _oKBtn;
}

-(UITextField *)authTextField{
    
    if (!_authTextField) {
        _authTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
        _authTextField.placeholder = @"请输入短信验证码";
        _authTextField.font = FONT_TITLE(kFont_Size_14);
        _authTextField.backgroundColor = [UIColor clearColor];
    }
    return _authTextField;
}

-(UIButton *)getVerificationCodeBtn{
    if (!_getVerificationCodeBtn) {
        _getVerificationCodeBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-107, 0, 107, 50)];
        _getVerificationCodeBtn.backgroundColor = [UIColor clearColor];
        //[_getVerificationCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _getVerificationCodeBtn.titleLabel.font = FONT_TITLE(kFont_Size_14);
        [_getVerificationCodeBtn setTitleColor:kApp_Corlor_8 forState:UIControlStateNormal];
        [_getVerificationCodeBtn addTarget:self action:@selector(getVerificationCode) forControlEvents:UIControlEventTouchUpInside];
    }
    return _getVerificationCodeBtn;
}


-(UITableView *)BankCardTable{
    if (!_BankCardTable) {
        _BankCardTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 155) style:UITableViewStylePlain];
        _BankCardTable.delegate = self;
        _BankCardTable.dataSource = self;
        _BankCardTable.backgroundColor = K_BACKGROUND_COLOR;
        _BankCardTable.allowsSelection = NO;
        _BankCardTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _BankCardTable.showsHorizontalScrollIndicator = NO;
        _BankCardTable.showsVerticalScrollIndicator = NO;
        _BankCardTable.bounces = NO;
    }
    return _BankCardTable;
}

@end
