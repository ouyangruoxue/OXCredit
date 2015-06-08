//
//  MoreTableViewCell.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/6.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "MoreTableViewCell.h"

@implementation MoreTableViewCell

-(void)dealloc{
    _lineView = nil;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(15, self.contentView.height - 0.5, SCREEN_WIDTH-30, 0.5)];
        _lineView.alpha = 0.3;
        _lineView.backgroundColor = kApp_Corlor_8;
        [self.contentView addSubview:_lineView];
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    _lineView.top = self.contentView.height - 0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
