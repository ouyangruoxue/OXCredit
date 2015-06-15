//
//  DealPassWordSetViewController.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "DealPassWordSetViewController.h"

@interface DealPassWordSetViewController ()
@property(nonatomic,strong)UITextField *passWordTextField;
@property(nonatomic,strong)UITextField *checkTextField;
@property(nonatomic,strong)UIButton    *oKBtn;
@end

@implementation DealPassWordSetViewController

-(void)dealloc{
    _passWordTextField =nil;
    _checkTextField = nil;
    _oKBtn = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    [self.topContainerView addSubview:self.backButton];
    self.titleText = @"设置交易密码";
    [self createDetailUI];
}


-(void)createDetailUI{
    
    UIView *topBackGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 50)];
    topBackGroundView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *topimage = [[UIImageView alloc] initWithImage:IMGNAMED(@"I_account_password_orange")];
    topimage.backgroundColor = [UIColor clearColor];
    topimage.centerY = 25;
    topimage.left = 20;
    [topBackGroundView addSubview:topimage];
    
    self.passWordTextField.left = topimage.right +15;
    [topBackGroundView addSubview:self.passWordTextField];
    
    
    UIView *underBackGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 70, SCREEN_WIDTH, 50)];
    underBackGroundView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *underimage = [[UIImageView alloc] initWithImage:IMGNAMED(@"I_account_password_grey")];
    underimage.backgroundColor = [UIColor clearColor];
    underimage.centerY = 25;
    underimage.left = 20;
    [underBackGroundView addSubview:underimage];
    
    self.checkTextField.left = underimage.right +15;
    [underBackGroundView addSubview:self.checkTextField];

  UILabel  *alertLabel = [[UILabel alloc] init];
    alertLabel.backgroundColor = [UIColor clearColor];
    alertLabel.numberOfLines = 0;
    alertLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    alertLabel.textAlignment = NSTextAlignmentLeft;
    alertLabel.textColor = [PUUtil getColorByHexadecimalColor:@"646464"];
    alertLabel.font = FONT_TITLE(kFont_Size_5);
    alertLabel.width = SCREEN_WIDTH-self.passWordTextField.left*2;
    alertLabel.height  = 40;
    alertLabel.text = @"6-12位字符，至少包含数字、字母（区分大小写）、符号中的2种";
    [alertLabel sizeToFit];
    alertLabel.top = underBackGroundView.bottom +10;
    alertLabel.left = self.passWordTextField.left;
    [self.containerView addSubview:alertLabel];
    
    self.oKBtn.top = alertLabel.bottom+30;
    [self.containerView addSubview:self.oKBtn];
    
    

    [self.containerView addSubview:topBackGroundView];
    [self.containerView addSubview:underBackGroundView];
}


#pragma mark buttonaction

-(void)confirmationBind{
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark get


-(UIButton *)oKBtn{
    if (!_oKBtn) {
        _oKBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 188, 30)];
        [_oKBtn setBackgroundImage:IMGNAMED(@"bind_kuang") forState:UIControlStateNormal];
        [_oKBtn setTitle:@"确定" forState:UIControlStateNormal];
        _oKBtn.titleLabel.font = FONT_TITLE(kFont_Size_14);
        [_oKBtn addTarget:self action:@selector(confirmationBind) forControlEvents:UIControlEventTouchUpInside];
        _oKBtn.centerX = SCREEN_WIDTH/2;
    }
    return _oKBtn;
}


-(UITextField *)passWordTextField{
    
    if (!_passWordTextField) {
        _passWordTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
        _passWordTextField.placeholder = @"输入交易密码";
        _passWordTextField.font = FONT_TITLE(kFont_Size_14);
        _passWordTextField.backgroundColor = [UIColor clearColor];
    }
    return _passWordTextField;
}


-(UITextField *)checkTextField{
    
    if (!_checkTextField) {
        _checkTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
        _checkTextField.placeholder = @"再一次输入交易密码";
        _checkTextField.backgroundColor = [UIColor clearColor];
        _checkTextField.font = FONT_TITLE(kFont_Size_14);
    }
    return _checkTextField;
}


@end
