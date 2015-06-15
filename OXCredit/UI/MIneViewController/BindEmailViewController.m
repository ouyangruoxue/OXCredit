//
//  BindEmailViewController.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/11.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "BindEmailViewController.h"
#import "PersonalTableViewCell.h"
@interface BindEmailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *emailTable;
@property(nonatomic,strong)UITextField *emailTextField;
@property(nonatomic,strong)UIButton *oKBtn;

@end

@implementation BindEmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    [self.topContainerView addSubview:self.backButton];
    self.titleText = @"绑定邮箱";
    [self.containerView addSubview:self.emailTable];
    [self.containerView addSubview:self.oKBtn];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark buttonAction
-(void)confirmationBind{
    
    if (_emailTextField.text.length == 0) {
        [PopupNotify showMessage:@"邮箱地址不能为空"];
        return;
    }
    else if(![PUUtil isEmailFormat:_emailTextField.text]){
        [PopupNotify showMessage:@"请填写正确的邮箱地址"];
        return;
    }
    
    _emailTable.hidden = YES;
    _oKBtn.hidden = YES;
    
    UIImageView *successImage = [[UIImageView alloc] initWithImage:IMGNAMED(@"send_a_success")];
    successImage.centerX = SCREEN_WIDTH/2;
    successImage.top = 50;
    [self.containerView addSubview:successImage];
    
    UILabel *alertlabel = [[UILabel alloc] init];
    alertlabel.backgroundColor = [UIColor clearColor];
    alertlabel.top = successImage.bottom +20;
    alertlabel.font = FONT_TITLE(kFont_Size_2);
    alertlabel.textColor = [PUUtil getColorByHexadecimalColor:@"646464"];
    alertlabel.text = @"验证邮件已发送到您的邮箱，请查收!";
    [alertlabel sizeToFit];
    alertlabel.centerX = SCREEN_WIDTH/2;
    [self.containerView addSubview:alertlabel];
    

}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
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
    titleLabel.text = @"请输入你需要绑定的邮箱地址";
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
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.toplineView.hidden = NO;
    cell.nameLabel.left = 20;
    cell.nameLabel.text = @"邮箱地址";
    self.emailTextField.left = 90;
    [cell.contentView addSubview:self.emailTextField];

        
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
        _oKBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.emailTable.bottom+30, 188, 30)];
        [_oKBtn setBackgroundImage:IMGNAMED(@"bind_kuang") forState:UIControlStateNormal];
        [_oKBtn setTitle:@"下一步" forState:UIControlStateNormal];
        _oKBtn.titleLabel.font = FONT_TITLE(kFont_Size_14);
        [_oKBtn addTarget:self action:@selector(confirmationBind) forControlEvents:UIControlEventTouchUpInside];
        _oKBtn.centerX = SCREEN_WIDTH/2;
    }
    return _oKBtn;
}

-(UITextField *)emailTextField{
    
    if (!_emailTextField) {
        _emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
        _emailTextField.placeholder = @"请输入邮箱地址";
        _emailTextField.font = FONT_TITLE(kFont_Size_14);
        _emailTextField.backgroundColor = [UIColor clearColor];
    }
    return _emailTextField;
}


-(UITableView *)emailTable{
    if (!_emailTable) {
        _emailTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100) style:UITableViewStylePlain];
        _emailTable.delegate = self;
        _emailTable.dataSource = self;
        _emailTable.backgroundColor = K_BACKGROUND_COLOR;
        _emailTable.allowsSelection = NO;
        _emailTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _emailTable.showsHorizontalScrollIndicator = NO;
        _emailTable.showsVerticalScrollIndicator = NO;
        _emailTable.bounces = NO;
    }
    return _emailTable;
}
@end
