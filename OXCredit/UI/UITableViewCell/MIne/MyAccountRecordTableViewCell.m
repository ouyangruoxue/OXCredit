//
//  MyAccountRecordTableViewCell.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/10.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "MyAccountRecordTableViewCell.h"

@interface MyAccountRecordTableViewCell()
@end

@implementation MyAccountRecordTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _recordTypeLabel = [[UILabel alloc] init];
        _recordTypeLabel.backgroundColor = [UIColor clearColor];
        _recordTypeLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _recordTypeLabel.textAlignment = NSTextAlignmentLeft;
        _recordTypeLabel.textColor = [PUUtil getColorByHexadecimalColor:@"4b4b4b"];
        _recordTypeLabel.font = BOLDFONT_TITLE(kFont_Size_14);
        _recordTypeLabel.width = SCREEN_WIDTH/3-40;
        _recordTypeLabel.height  = 44;
        _recordTypeLabel.text = @"提现";
        _recordTypeLabel.left = 40;
        _recordTypeLabel.top = 0;
        [self.contentView addSubview:_recordTypeLabel];
        
        
        _amountLabel = [[UILabel alloc] init];
        _amountLabel.backgroundColor = [UIColor clearColor];
        _amountLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _amountLabel.textAlignment = NSTextAlignmentLeft;
        _amountLabel.textColor = [PUUtil getColorByHexadecimalColor:@"4b4b4b"];
        _amountLabel.font = FONT_TITLE(kFont_Size_14);
        _amountLabel.width = SCREEN_WIDTH/3;
        _amountLabel.height  = 44;
        _amountLabel.text = @"500.00";
        _amountLabel.left = _recordTypeLabel.right;
        _amountLabel.top = 0;
        [self.contentView addSubview:_amountLabel];
        
        
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.backgroundColor = [UIColor clearColor];
        _timeLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.textColor = [PUUtil getColorByHexadecimalColor:@"4b4b4b"];
        _timeLabel.font = FONT_TITLE(kFont_Size_14);
        _timeLabel.width = SCREEN_WIDTH/3;
        _timeLabel.height  = 44;
        _timeLabel.text = @"2015-12-14";
        _timeLabel.left = _amountLabel.right;
        _timeLabel.top = 0;
        [self.contentView addSubview:_timeLabel];

        self.contentView.backgroundColor = kApp_Corlor_1;
        
        UIView  *lineView = [[UIView alloc] initWithFrame:CGRectMake(20, 43.5, SCREEN_WIDTH-40, 0.5)];
        lineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [self.contentView addSubview:lineView];
        
    }
    return self;
}


@end
