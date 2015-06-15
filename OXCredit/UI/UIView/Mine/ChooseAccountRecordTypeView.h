//
//  ChooseAccountRecordTypeView.h
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/10.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ChooseTypeDelegate <NSObject>

@optional
-(void)didSelectWithDic:(NSString *)type;

@end

@interface ChooseAccountRecordTypeView : UIView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, assign) id<ChooseTypeDelegate> chooseDelegate;
-(id)initWithFrame:(CGRect)frame withArr:(NSMutableArray *)sourceDataArr withType:(choosePopViewType)type;

@end
