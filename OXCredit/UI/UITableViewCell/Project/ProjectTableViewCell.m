//
//  ProjectTableViewCell.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/6.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "ProjectTableViewCell.h"

@interface ProjectTableViewCell ()
@property(nonatomic,strong)UIImageView *circleImage;
@property(nonatomic,strong)UILabel *typeLabel;
@property(nonatomic,strong)UILabel *projectTitle;
@property(nonatomic,strong)CustomBadge *badageView;
@end

@implementation ProjectTableViewCell

-(void)dealloc{
    
    _circleImage = nil;
    _typeLabel = nil;
    _badageView = nil;
    _projectTitle = nil;
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentView.backgroundColor = K_BACKGROUND_COLOR;
        

       UIImageView *bottomImage = [[UIImageView alloc] initWithImage:[PUUtil stretchImage:IMGNAMED(@"project_cell_background") capInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch]];
        bottomImage.left = 10;
        bottomImage.centerY  = 50;
        bottomImage.width = SCREEN_WIDTH -20;
        bottomImage.contentMode = UIViewContentModeScaleAspectFit;
        bottomImage.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:bottomImage];
        
        

        _circleImage = [[UIImageView alloc] initWithImage:[PUUtil stretchImage:IMGNAMED(@"project_cell_circle") capInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch]];
        _circleImage.left = 20;
        _circleImage.centerY  = 50;
        _circleImage.contentMode = UIViewContentModeScaleAspectFit;
        _circleImage.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_circleImage];
        
        _typeLabel = [[UILabel alloc] init];
        _typeLabel.backgroundColor = [UIColor clearColor];
        _typeLabel.numberOfLines = 1;
        _typeLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _typeLabel.textAlignment = NSTextAlignmentLeft;
        _typeLabel.textColor = [PUUtil getColorByHexadecimalColor:@"f66060"];
        _typeLabel.font = FONT_TITLE(kFont_Size_2);
        _typeLabel.width = 60;
        _typeLabel.height  = 20;
        _typeLabel.text = @"投资";
        [_typeLabel sizeToFit];
        _typeLabel.center = _circleImage.center;
        [self.contentView addSubview:_typeLabel];
        
        
        _projectTitle = [[UILabel alloc] init];
        _projectTitle.backgroundColor = [UIColor clearColor];
        _projectTitle.numberOfLines = 2;
        _projectTitle.lineBreakMode = NSLineBreakByTruncatingTail;
        _projectTitle.textAlignment = NSTextAlignmentLeft;
        _projectTitle.textColor = [PUUtil getColorByHexadecimalColor:@"4b4b4b"];
        _projectTitle.font = FONT_TITLE(kFont_Size_14);
        _projectTitle.width = SCREEN_WIDTH-60-30-60;
        _projectTitle.left = _circleImage.right+20;
        _projectTitle.top = _circleImage.top;
        _projectTitle.text = @"好利信好利信好利信好利信好利信好利信好利信好利信好利信好利信好利信好利信好利信好利信";
        [_projectTitle sizeToFit];
        [self.contentView addSubview:_projectTitle];
        
        [self.contentView addSubview:self.badageView];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (CustomBadge *)badageView {
    if (_badageView == nil)
    {
        _badageView = [CustomBadge customBadgeWithString:[NSString stringWithFormat:@"%d",10]
                                         withStringColor:[UIColor whiteColor]
                                          withInsetColor:[PUUtil getColorByHexadecimalColor:@"df3d3e"]
                                          withBadgeFrame:YES
                                     withBadgeFrameColor:[PUUtil getColorByHexadecimalColor:@"df3d3e"]
                                               withScale:2.0
                                             withShining:YES withMinFontSize:kFont_Size_3 withMaxfontSize:kFont_Size_2];
        _badageView.frame = CGRectMake(SCREEN_WIDTH - 45, 55, 30, 30);
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
