//
//  BindMobileViewController.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "BindMobileViewController.h"
#import "PersonalTableViewCell.h"
@interface BindMobileViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *bindMobileTable;
@property(nonatomic,strong)UIButton  *getVerificationCodeBtn;
@property(nonatomic,strong)UITextField *verifyTextfield;
@property(nonatomic,strong)UITextField *mobileTextField;
@property(nonatomic,strong)NSTimer  *resendPasswordTimer;
@property(nonatomic,assign)NSInteger canresendSeconds;
@property(nonatomic,strong)UIButton *oKBtn;

@end

@implementation BindMobileViewController

-(void)dealloc{
    _bindMobileTable = nil;
    _getVerificationCodeBtn = nil;
    _verifyTextfield = nil;
    _mobileTextField = nil;
    if([_resendPasswordTimer isValid]){
        [_resendPasswordTimer invalidate];
        _resendPasswordTimer = nil;
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}



-(void)initUI{
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    [self.topContainerView addSubview:self.backButton];
    self.titleText = @"绑定手机";
    [self.containerView addSubview:self.bindMobileTable];
    
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
        _canresendSeconds = 120;
    }else{
        _canresendSeconds = second;
    }
}

- (void)ontimer {
    if (_canresendSeconds >0){
        [_getVerificationCodeBtn setTitle:[NSString stringWithFormat:@"重新发送(%ld)", (long)_canresendSeconds] forState:UIControlStateNormal];
        _getVerificationCodeBtn.backgroundColor = [PUUtil getColorByHexadecimalColor:@"bbbbbb"];
        _getVerificationCodeBtn.enabled = NO;
        _canresendSeconds --;
    } else {
        [_getVerificationCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _getVerificationCodeBtn.backgroundColor = [PUUtil getColorByHexadecimalColor:@"df3d3e"];
        _getVerificationCodeBtn.enabled = YES;
        if ([_resendPasswordTimer isValid]) {
            [_resendPasswordTimer invalidate];
            _resendPasswordTimer = nil;
        }
    }
}

#pragma mark buttonAction
-(void)getVerificationCode{
    
    [self setTimerForResendButton:-1];
}

-(void)confirmationBind{
    
    if (_verifyTextfield.text.length == 0) {
        [PopupNotify showMessage:@"验证码不能为空"];
        return;
    }
    
    if (_mobileTextField.text.length == 0) {
        [PopupNotify showMessage:@"手机号不能为空"];
        return;
    }
    else if([PUUtil isMoblieNum:_mobileTextField.text]){
        [PopupNotify showMessage:@"请填写正确的手机号"];
        return;
    }
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    headView.backgroundColor = [UIColor clearColor];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = FONT_TITLE(kFont_Size_5);
    titleLabel.textColor = [PUUtil getColorByHexadecimalColor:@"646464"];
    titleLabel.text = @"请输入你需要绑定的手机号码";
    [titleLabel sizeToFit];
    titleLabel.bottom = 40;
    titleLabel.left = 20;
    
    [headView addSubview:titleLabel];
    
    return headView;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *playByPlayTableViewCell = @"PersonalTableViewCell";
    PersonalTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:playByPlayTableViewCell];
    if (cell == nil) {
        cell = [[PersonalTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:playByPlayTableViewCell];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.nameLabel.left = 20;

    if (indexPath.row == 0) {
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        cell.nameLabel.text = @"国家和地区";
        
        cell.accessLabel.text = @"中国大陆  +86";
    }
    else if (indexPath.row == 1){
        cell.nameLabel.text = @"手机号";
        self.mobileTextField.left = 70;
        [cell.contentView addSubview:self.mobileTextField];
        cell.accessoryView = self.getVerificationCodeBtn;
        
    }
    else{
        cell.nameLabel.text = @"手机验证码";
        self.verifyTextfield.left = 100;
        [cell.contentView addSubview:self.verifyTextfield];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
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
        _oKBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.bindMobileTable.bottom+30, 188, 30)];
        [_oKBtn setBackgroundImage:IMGNAMED(@"bind_kuang") forState:UIControlStateNormal];
        [_oKBtn setTitle:@"确定" forState:UIControlStateNormal];
        _oKBtn.titleLabel.font = FONT_TITLE(kFont_Size_14);
        [_oKBtn addTarget:self action:@selector(confirmationBind) forControlEvents:UIControlEventTouchUpInside];
        _oKBtn.centerX = SCREEN_WIDTH/2;
    }
    return _oKBtn;
}


-(UIButton *)getVerificationCodeBtn{
    if (!_getVerificationCodeBtn) {
        _getVerificationCodeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 24)];
        _getVerificationCodeBtn.backgroundColor = [PUUtil getColorByHexadecimalColor:@"df3d3e"];
        [_getVerificationCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _getVerificationCodeBtn.titleLabel.font = FONT_TITLE(kFont_Size_14);
        _getVerificationCodeBtn.layer.cornerRadius = 10;
        _getVerificationCodeBtn.layer.masksToBounds = YES;
        [_getVerificationCodeBtn addTarget:self action:@selector(getVerificationCode) forControlEvents:UIControlEventTouchUpInside];
    }
    return _getVerificationCodeBtn;
}

-(UITextField *)mobileTextField{
    
    if (!_mobileTextField) {
        _mobileTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
        _mobileTextField.placeholder = @"请输入手机号";
        _mobileTextField.font = FONT_TITLE(kFont_Size_14);
        _mobileTextField.backgroundColor = [UIColor clearColor];
    }
    return _mobileTextField;
}


-(UITextField *)verifyTextfield{
    
    if (!_verifyTextfield) {
        _verifyTextfield = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
        _verifyTextfield.placeholder = @"请输入手机验证码";
        _verifyTextfield.backgroundColor = [UIColor clearColor];
        _verifyTextfield.font = FONT_TITLE(kFont_Size_14);
    }
    return _verifyTextfield;
}

-(UITableView *)bindMobileTable{
    if (!_bindMobileTable) {
        _bindMobileTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200) style:UITableViewStylePlain];
        _bindMobileTable.delegate = self;
        _bindMobileTable.dataSource = self;
        _bindMobileTable.backgroundColor = K_BACKGROUND_COLOR;
        _bindMobileTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _bindMobileTable.showsHorizontalScrollIndicator = NO;
        _bindMobileTable.showsVerticalScrollIndicator = NO;
        _bindMobileTable.bounces = NO;
    }
    return _bindMobileTable;
}

@end
