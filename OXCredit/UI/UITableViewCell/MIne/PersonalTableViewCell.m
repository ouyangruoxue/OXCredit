//
//  PersonalTableViewCell.m
//  ZSFlower
//
//  Created by zuo xiaolin on 15/5/8.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "PersonalTableViewCell.h"

@implementation PersonalTableViewCell


-(void)dealloc{
    _lineView = nil;
    _iconImage = nil;
    _nameLabel = nil;
    _accessLabel = nil;
    _badageView = nil;
    _redPoint = nil;
    _toplineView = nil;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        _toplineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
        _toplineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        _toplineView.hidden = YES;
        [self.contentView addSubview:self.toplineView];
        
        //头像
        _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 35, 30)];
        _iconImage.contentMode = UIViewContentModeCenter;
        _iconImage.backgroundColor = [UIColor clearColor];
        _iconImage.centerY = 25;
        [self.contentView addSubview:_iconImage];
        
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(_iconImage.right+10,  15, 150, 20)];
        [_nameLabel setBackgroundColor:[UIColor clearColor]];
        [_nameLabel setFont:FONT_TITLE(kFont_Size_14)];
        [_nameLabel setTextColor:[PUUtil getColorByHexadecimalColor:@"4b4b4b"]];
        [self.contentView addSubview:_nameLabel];
        
        
        _accessLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 125,  15, 100, 20)];
        [_accessLabel setBackgroundColor:[UIColor clearColor]];
        _accessLabel.textAlignment = [PUUtil getTextAlign:TextAlignTypeRight];
        [_accessLabel setFont:FONT_TITLE(kFont_Size_5)];
        [_accessLabel setTextColor:[PUUtil getColorByHexadecimalColor:@"4b4b4b"]];
        [self.contentView addSubview:_accessLabel];
        
        
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 49.5, SCREEN_WIDTH, 0.5)];
        _lineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e5e5e5"];
        [self.contentView addSubview:_lineView];
        
        _redPoint = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-32, self.contentView.height/2-4, 8, 8)];
        [_redPoint setImage:[UIImage imageNamed:@"noreadmessage"]];
        _redPoint.backgroundColor = [UIColor clearColor];
        _redPoint.hidden = YES;
        [self.contentView addSubview:_redPoint];
        
        [self.contentView addSubview:self.badageView];
        
        [self setUnreadNumber:0];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _iconImage.centerY = self.contentView.height/2;
    _nameLabel.centerY = self.contentView.height/2;
    _accessLabel.centerY = self.contentView.height/2;
    _badageView.centerY = self.contentView.height/2;
    _redPoint.centerY = self.contentView.height/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (CustomBadge *)badageView {
    if (_badageView == nil)
    {
        _badageView = [CustomBadge customBadgeWithString:[NSString stringWithFormat:@"%d",0]
                                         withStringColor:[UIColor whiteColor]
                                          withInsetColor:[PUUtil getColorByHexadecimalColor:@"f66060"]
                                          withBadgeFrame:YES
                                     withBadgeFrameColor:[PUUtil getColorByHexadecimalColor:@"f66060"]
                                               withScale:1.5
                                             withShining:YES withMinFontSize:kFont_Size_10 withMaxfontSize:kFont_Size_7];
        _badageView.frame = CGRectMake(28, 8, 12, 12);
        [self.contentView addSubview:_badageView];
    }
    return _badageView;
}

#pragma mark - set unread num
-(void)setUnreadNumber:(NSInteger)num {
    if (num == 0) {
        if (_badageView) {
            _badageView.hidden = YES;
        }
        
    }else {
        if (num <= 99) {
            [_badageView autoBadgeSizeWithString:[NSString stringWithFormat:@"%ld",num]];
        }else {
            [_badageView autoBadgeSizeWithString:@"99"];
        }
        self.badageView.hidden = NO;
        [_badageView setNeedsLayout];
        [_badageView setNeedsDisplay];
    }
}

@end
