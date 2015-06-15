//
//  myReleaseTableViewCell.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/9.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "myReleaseTableViewCell.h"

@interface myReleaseTableViewCell()
@end

@implementation myReleaseTableViewCell
-(void)dealloc{
    _nameLabel = nil;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.textColor = [PUUtil getColorByHexadecimalColor:@"4b4b4b"];
        _nameLabel.font = BOLDFONT_TITLE(kFont_Size_2);
        _nameLabel.width = 80;
        _nameLabel.height  = 20;
        _nameLabel.left = 20;
        [self.contentView addSubview:_nameLabel];
        
        
        
       _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 49.5, SCREEN_WIDTH, 0.5)];
        _lineView.backgroundColor = [PUUtil getColorByHexadecimalColor:@"e0e0e0"];
        [self.contentView addSubview:_lineView];
        
    }
    return self;
}



-(void)layoutSubviews{
    [super layoutSubviews];
    _nameLabel.centerY = self.contentView.height/2;
    _lineView.top = self.contentView.height -0.5;
}


@end
