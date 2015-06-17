//
//  BindBankCardInfoViewController.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/16.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "BindBankCardInfoViewController.h"
#import "BankCardMobileAuthViewController.h"
#import "PersonalTableViewCell.h"

@interface BindBankCardInfoViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *BankCardTable;
@property(nonatomic,strong)UITextField *mobileTextField;
@property(nonatomic,strong)UILabel *bankCardType;
@property(nonatomic,strong)UIButton *oKBtn;

@end

@implementation BindBankCardInfoViewController

-(void)dealloc{
    
    _BankCardTable = nil;
    _mobileTextField = nil;
    _bankCardType = nil;
    _oKBtn = nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    [self.topContainerView addSubview:self.backButton];
    self.titleText = @"填写银行卡信息";
    [self.containerView addSubview:self.BankCardTable];
    [self.containerView addSubview:self.oKBtn];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark buttonAction
-(void)confirmationBind{
    
    if(![PUUtil isMoblieNum:_mobileTextField.text]){
        [PopupNotify showMessage:@"请输入正确的手机号"];
        return;
    }
    
    BankCardMobileAuthViewController *cardInfo = [[BankCardMobileAuthViewController alloc] init];
    [self.navigationController pushViewController:cardInfo animated:YES];
    
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
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
    if (indexPath.row == 0) {
        cell.toplineView.hidden = NO;
        cell.nameLabel.left = 20;
        cell.nameLabel.text = @"卡类型";
        self.bankCardType.left = 80;
        [cell.contentView addSubview:self.bankCardType];
        
    }
    else{
        cell.toplineView.hidden = YES;
        cell.nameLabel.left = 20;
        cell.nameLabel.text = @"手机号";
        self.mobileTextField.left = 80;
        [cell.contentView addSubview:self.mobileTextField];
        
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
        _oKBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.BankCardTable.bottom+30, 188, 30)];
        [_oKBtn setBackgroundImage:IMGNAMED(@"bind_kuang") forState:UIControlStateNormal];
        [_oKBtn setTitle:@"下一步" forState:UIControlStateNormal];
        _oKBtn.titleLabel.font = FONT_TITLE(kFont_Size_14);
        [_oKBtn addTarget:self action:@selector(confirmationBind) forControlEvents:UIControlEventTouchUpInside];
        _oKBtn.centerX = SCREEN_WIDTH/2;
    }
    return _oKBtn;
}

-(UILabel *)bankCardType{
    
    if (!_bankCardType) {
        _bankCardType = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
        _bankCardType.font = FONT_TITLE(kFont_Size_14);
        _bankCardType.backgroundColor = [UIColor clearColor];
    }
    return _bankCardType;
}

-(UITextField *)mobileTextField{
    
    if (!_mobileTextField) {
        _mobileTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
        _mobileTextField.placeholder = @"请输入银行预留的手机号";
        _mobileTextField.font = FONT_TITLE(kFont_Size_14);
        _mobileTextField.backgroundColor = [UIColor clearColor];
    }
    return _mobileTextField;
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
