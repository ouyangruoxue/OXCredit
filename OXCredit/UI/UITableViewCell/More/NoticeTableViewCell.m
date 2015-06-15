//
//  NoticeTableViewCell.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/9.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "NoticeTableViewCell.h"

@interface NoticeTableViewCell()
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *subTitle;
@property(nonatomic,strong)UIImageView *rightTriangle;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UILabel *timeLabel;
@end

@implementation NoticeTableViewCell

-(void)dealloc{
    _lineView = nil;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.numberOfLines = 1;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = [PUUtil getColorByHexadecimalColor:@"4b4b4b"];
        _titleLabel.font = BOLDFONT_TITLE(kFont_Size_2);
        _titleLabel.width = SCREEN_WIDTH-60-30;
        _titleLabel.height  = 20;
        _titleLabel.text = @"星宿老怪，法力无边，千秋万代，一统江湖";
        _titleLabel.left = 20;
        _titleLabel.top =15;
        [self.contentView addSubview:_titleLabel];
        
        
        _rightTriangle = [[UIImageView alloc]initWithImage:IMGNAMED(@"right_triangle")];
        _rightTriangle.centerY = _titleLabel.centerY;
        _rightTriangle.right = SCREEN_WIDTH -20;
        [self.contentView addSubview:_rightTriangle];
        
        
        
        _subTitle = [[UILabel alloc] init];
        _subTitle.backgroundColor = [UIColor clearColor];
        _subTitle.numberOfLines = 1;
        _subTitle.lineBreakMode = NSLineBreakByTruncatingTail;
        _subTitle.textAlignment = NSTextAlignmentLeft;
        _subTitle.textColor = [PUUtil getColorByHexadecimalColor:@"646464"];
        _subTitle.font = FONT_TITLE(kFont_Size_2);
        _subTitle.width = SCREEN_WIDTH-60-30;
        _subTitle.height  = 20;
        _subTitle.text = @"星宿老怪，一统江湖";
        [_subTitle sizeToFit];
        _subTitle.left = _titleLabel.left;
        _subTitle.top = _titleLabel.bottom+5;
        [self.contentView addSubview:_subTitle];
        
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.backgroundColor = [UIColor clearColor];
        _contentLabel.numberOfLines = 2;
        _contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.textColor = [PUUtil getColorByHexadecimalColor:@"646464"];
        _contentLabel.font = FONT_TITLE(kFont_Size_14);
        _contentLabel.width = SCREEN_WIDTH-40;
        _contentLabel.height  = 20;
        _contentLabel.text = @"星宿老怪，法力无边，千秋万代，一统江湖,星宿老怪，法力无边，千秋万代，一统江湖,星宿老怪，法力无边，千秋万代，一统江湖";
        [_contentLabel sizeToFit];
        _contentLabel.left = _titleLabel.left;
        _contentLabel.top = _subTitle.bottom+5;
        [self.contentView addSubview:_contentLabel];
        
        
        
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.backgroundColor = [UIColor clearColor];
        _timeLabel.numberOfLines = 2;
        _timeLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.textColor = [PUUtil getColorByHexadecimalColor:@"646464"];
        _timeLabel.font = FONT_TITLE(kFont_Size_5);
        _timeLabel.width = SCREEN_WIDTH-60-30-60;
        _timeLabel.height  = 20;
        _timeLabel.text = @"05-25 18：30";
        [_timeLabel sizeToFit];
        _timeLabel.right = SCREEN_WIDTH-20;
        _timeLabel.bottom = 113;
        [self.contentView addSubview:_timeLabel];
        
        
        
        
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.contentView.height - 0.5, SCREEN_WIDTH, 0.5)];
        _lineView.alpha = 0.3;
        _lineView.backgroundColor = kApp_Corlor_8;
        [self.contentView addSubview:_lineView];
    }
    return self;
}


-(void)setNoticeCellWithObject:(id)object{
    
    
}


-(void)layoutSubviews{
    [super layoutSubviews];
    _lineView.top = self.contentView.height - 0.5;

}

@end
