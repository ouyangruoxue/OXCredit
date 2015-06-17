//
//  BankCardAuthViewController.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/16.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "BankCardAuthViewController.h"
#import "PersonalTableViewCell.h"
#import "BindBankCardInfoViewController.h"
@interface BankCardAuthViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *BankCardTable;
@property(nonatomic,strong)UITextField *nameTextField;
@property(nonatomic,strong)UITextField *CardNumTextField;
@property(nonatomic,strong)UIButton *oKBtn;

@end

@implementation BankCardAuthViewController
-(void)dealloc{
    _BankCardTable = nil;
    _nameTextField = nil;
    _CardNumTextField = nil;
    _oKBtn = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
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
#pragma mark buttonAction
-(void)confirmationBind{
    
    if (_nameTextField.text.length == 0) {
        [PopupNotify showMessage:@"姓名不能为空"];
        return;
    }
//    else if(![PUUtil isCorrectBankCardNum:_CardNumTextField.text]){
//        [PopupNotify showMessage:@"请输入正确的银行卡号"];
//        return;
//    }
    
    BindBankCardInfoViewController *cardInfo = [[BindBankCardInfoViewController alloc] init];
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
    
    return 55;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 55)];
    headView.backgroundColor = [UIColor clearColor];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = FONT_TITLE(kFont_Size_5);
    titleLabel.textColor = [PUUtil getColorByHexadecimalColor:@"646464"];
    titleLabel.text = @"请填写您本人银行卡信息(只能为借记卡)";
    [titleLabel sizeToFit];
    titleLabel.left = 20;
    titleLabel.centerY = 55/2;
    
    
    NSMutableAttributedString  *attributedString = [[NSMutableAttributedString alloc] initWithString:titleLabel.text];
    
    [attributedString setAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:kFont_Size_5],NSFontAttributeName,[PUUtil getColorByHexadecimalColor:@"ff6600"],NSForegroundColorAttributeName,nil] range:NSMakeRange(15, 3)];
    titleLabel.attributedText = attributedString;
    
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
    if (indexPath.row == 0) {
        cell.toplineView.hidden = NO;
        cell.nameLabel.left = 20;
        cell.nameLabel.text = @"持卡人";
        self.nameTextField.left = 90;
        [cell.contentView addSubview:self.nameTextField];
 
    }
    else{
        cell.toplineView.hidden = YES;
        cell.nameLabel.left = 20;
        cell.nameLabel.text = @"银行卡号";
        self.CardNumTextField.left = 90;
        [cell.contentView addSubview:self.CardNumTextField];

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

-(UITextField *)nameTextField{
    
    if (!_nameTextField) {
        _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
        _nameTextField.placeholder = @"请输入姓名";
        _nameTextField.font = FONT_TITLE(kFont_Size_14);
        _nameTextField.backgroundColor = [UIColor clearColor];
    }
    return _nameTextField;
}

-(UITextField *)CardNumTextField{
    
    if (!_CardNumTextField) {
        _CardNumTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
        _CardNumTextField.placeholder = @"请输入银行卡号";
        _CardNumTextField.font = FONT_TITLE(kFont_Size_14);
        _CardNumTextField.backgroundColor = [UIColor clearColor];
    }
    return _CardNumTextField;
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
