//
//  ChooseAccountRecordTypeView.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/10.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "ChooseAccountRecordTypeView.h"

@interface ChooseAccountRecordTypeView ()
@property(nonatomic,strong)UITableView *chooseTypeTable;
@property(nonatomic,strong)NSMutableArray *typeArr;
@end


@implementation ChooseAccountRecordTypeView

-(void)dealloc{
    
    _chooseDelegate = nil;
    _chooseTypeTable = nil;
    _typeArr = nil;
}


-(id)initWithFrame:(CGRect)frame withArr:(NSMutableArray *)sourceDataArr withType:(choosePopViewType)type
{
    if (self = [super initWithFrame:frame]){
        
        if (type == myAccountType) {
            _typeArr =[[NSMutableArray alloc] initWithObjects:@"提现",@"充值",@"投资",@"收益",@"冻结", nil];
        }
        else{
            _typeArr =[[NSMutableArray alloc] initWithObjects:@"全部产品",@"理财类",@"投资类",@"发起类", nil];
        }
        [self addSubview:self.chooseTypeTable];
    }
    return self;
}



#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _typeArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *playByPlayTableViewCell = @"UITableViewCell";
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:playByPlayTableViewCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:playByPlayTableViewCell];
        
    }
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 21.5, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
    [cell.contentView addSubview:lineView];
    cell.textLabel.font = FONT_TITLE(kFont_Size_5);
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.text = [_typeArr objectAtIndex:indexPath.row];
        return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if(_chooseDelegate&&[_chooseDelegate respondsToSelector:@selector(didSelectWithDic:)]){
        
            NSString *selectStr = [_typeArr objectAtIndex:indexPath.row];
        
                [_chooseDelegate didSelectWithDic:selectStr];
            }
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 22;
}





-(UITableView *)chooseTypeTable {
    if (!_chooseTypeTable) {
        _chooseTypeTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _chooseTypeTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _chooseTypeTable.dataSource = self;
        _chooseTypeTable.delegate = self;
        _chooseTypeTable.scrollEnabled = NO;
        _chooseTypeTable.backgroundColor = [UIColor clearColor];
        _chooseTypeTable.tableHeaderView = [[UIView alloc] init];
        _chooseTypeTable.tableFooterView = [[UIView alloc] init];
    }
    
    return _chooseTypeTable;
}
@end
