//
//  MyProductViewController.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/12.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "MyProductViewController.h"
#import "ChooseAccountRecordTypeView.h"
#import "MyReleasedProductViewController.h"
#import "MyAccountRecordTableViewCell.h"
@interface MyProductViewController ()<ChooseTypeDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *productTable;
@property(nonatomic,strong)UIButton *titleBtn;
@property(nonatomic,strong)ChooseAccountRecordTypeView *chooseTypeView;
@end

@implementation MyProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initUI{
    
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    [self.topContainerView addSubview:self.backButton];
    [self setNavTitleWithTitle:@"全部产品"];
    [self.containerView addSubview:self.chooseTypeView];
    [self.view bringSubviewToFront:self.topImageView];
    [self.containerView addSubview:self.productTable];
    if (IOS7_OR_LATER) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [self createBottomView];
    [self.containerView addSubview:self.chooseTypeView];
    [self.view bringSubviewToFront:self.topImageView];
}

#pragma  mark buttonAction
-(void)chooseProductType{
    
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

-(void)myReleaseProduct{
    
    MyReleasedProductViewController *myReleaseProduct = [[MyReleasedProductViewController alloc] init];
    [self.navigationController pushViewController:myReleaseProduct animated:YES];
}


#pragma chooseTypeDelegate
-(void)didSelectWithDic:(NSString *)type{
    
    [self setNavTitleWithTitle:type];
    [self chooseProductType];
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
        [_titleBtn addTarget:self action:@selector(chooseProductType) forControlEvents:UIControlEventTouchUpInside];
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
    
    UIButton *drawMoneyBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,49 )];
    [drawMoneyBtn setTitle:@"我要发布" forState:UIControlStateNormal];
    drawMoneyBtn.titleLabel.font = FONT_TITLE(kFont_Size_2);
    [drawMoneyBtn setTitleColor:[PUUtil getColorByHexadecimalColor:@"3e2eb6"] forState:UIControlStateNormal];
    [drawMoneyBtn setBackgroundColor:[UIColor clearColor]];
    [drawMoneyBtn addTarget:self action:@selector(myReleaseProduct) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:drawMoneyBtn];
    
    [self.containerView addSubview:backgroundView];
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50 ;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    headView.backgroundColor = [UIColor clearColor];
    
    UILabel *typeLabel = [[UILabel alloc] init];
    typeLabel.backgroundColor = [UIColor clearColor];
    typeLabel.font = FONT_TITLE(kFont_Size_5);
    typeLabel.textColor = [PUUtil getColorByHexadecimalColor:@"4b4b4b"];
    typeLabel.text = @"项目名称";
    [typeLabel sizeToFit];
    typeLabel.centerY = 25;
    typeLabel.centerX = SCREEN_WIDTH/6;
    [headView addSubview:typeLabel];
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.backgroundColor = [UIColor clearColor];
    timeLabel.font = FONT_TITLE(kFont_Size_5);
    timeLabel.textColor = [PUUtil getColorByHexadecimalColor:@"4b4b4b"];
    timeLabel.text = @"项目名称";
    [timeLabel sizeToFit];
    timeLabel.centerY = 25;
    timeLabel.centerX = SCREEN_WIDTH/2;
    [headView addSubview:timeLabel];
    
    UILabel *amountLabel = [[UILabel alloc] init];
    amountLabel.backgroundColor = [UIColor clearColor];
    amountLabel.font = FONT_TITLE(kFont_Size_5);
    amountLabel.textColor = [PUUtil getColorByHexadecimalColor:@"4b4b4b"];
    amountLabel.text = @"项目名称";
    [amountLabel sizeToFit];
    amountLabel.centerY = 25;
    amountLabel.centerX = SCREEN_WIDTH/6*5;
    [headView addSubview:amountLabel];
    
    
    UIView *firstlineView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/3-1, 10, 1, 30)];
    firstlineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e0e0e0"];
    [headView addSubview:firstlineView];
    
    UIView *secondlineView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/3*2-1, 10, 1, 30)];
    secondlineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e0e0e0"];
    [headView addSubview:secondlineView];

    
    return headView;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *playByPlayTableViewCell = @"MyAccountRecordTableViewCell";
    MyAccountRecordTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:playByPlayTableViewCell];
    if (cell == nil) {
        cell = [[MyAccountRecordTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:playByPlayTableViewCell];
    }
    cell.timeLabel.left = cell.recordTypeLabel.right;
    cell.amountLabel.left  = cell.timeLabel.right;
    cell.amountLabel.textAlignment = NSTextAlignmentCenter;
    cell.timeLabel.textAlignment = NSTextAlignmentCenter;
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

#pragma mark get-

-(ChooseAccountRecordTypeView *)chooseTypeView{
    
    if (!_chooseTypeView) {
        _chooseTypeView = [[ChooseAccountRecordTypeView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-40, -112, 80, 112) withArr:nil withType:myProductType];
        _chooseTypeView.hidden = YES;
        _chooseTypeView.backgroundColor = [UIColor clearColor];
        _chooseTypeView.chooseDelegate = self;
    }
    return _chooseTypeView;
}

-(UITableView *)productTable{
    if (!_productTable) {
        _productTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.containerView.height-KTABBARHEIGHT) style:UITableViewStylePlain];
        _productTable.delegate = self;
        _productTable.dataSource = self;
        _productTable.backgroundColor = [UIColor clearColor];
        _productTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _productTable.showsHorizontalScrollIndicator = NO;
        _productTable.showsVerticalScrollIndicator = NO;
        _productTable.bounces = YES;
    }
    return _productTable;
}


@end
