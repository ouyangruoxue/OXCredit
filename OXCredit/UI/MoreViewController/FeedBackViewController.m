//
//  FeedBackViewController.m
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/9.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import "FeedBackViewController.h"

@interface FeedBackViewController ()<UITextViewDelegate>
@property(nonatomic,strong)UITextView *textView;
@property(nonatomic,strong)UILabel    *leftcharNumLabel;
@property(nonatomic,strong)UILabel    *placeHold;
@property(nonatomic,strong)UIButton   *sendCommitBtn;
@end

@implementation FeedBackViewController

-(id)init{
    if (self == [super init]) {
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI{
    
    self.containerView.backgroundColor = K_BACKGROUND_COLOR;
    self.titleText = @"意见反馈";
    [self.topContainerView addSubview:self.backButton];
    
    [self.containerView addSubview:self.textView];
    
    [self.containerView addSubview:self.leftcharNumLabel];
    
    [self.containerView addSubview:self.placeHold];
    
    [self.containerView addSubview:self.sendCommitBtn];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSNotificationCenter *center = NOTIFICATION_DEFAULT ;
    [center addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [_textView becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSNotificationCenter *center = NOTIFICATION_DEFAULT ;
    [center removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

- (void)keyboardWillShow:(id)notification {
    int keyboardHeight = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    _textView.height = [UIScreen mainScreen].bounds.size.height - 64 - keyboardHeight - 80;
    
    _leftcharNumLabel.right =  _textView.right - 5;
    _leftcharNumLabel.bottom = _textView.bottom - 5;
    
    _sendCommitBtn.top = _textView.bottom +30;
}

#pragma mark uitextviewdelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    //int max = 16;
   // NSMutableString *newtext =[NSMutableString stringWithString:textView.text];
    //[newtext replaceCharactersInRange:range withString:text];

    return YES;
    
}

- (void)textViewDidChange:(UITextView *)textView {
    _placeHold.hidden = [textView.text length];
    if ([textView.text length]) {
        
        _sendCommitBtn.enabled = YES;
        _sendCommitBtn.backgroundColor = [PUUtil getColorByHexadecimalColor:@"df3d3e"];

    }
    else{
        _sendCommitBtn.enabled = NO;
        _sendCommitBtn.backgroundColor = kApp_Corlor_8;

    }
    
    _leftcharNumLabel.text = [NSString stringWithFormat:@"您还可以输入%d字", 500 - [Utility countWord:textView.text]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark get -
-(UITextView *)textView{
    
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, 213)];
        [_textView setFont:[UIFont systemFontOfSize:16.0]];
        _textView.backgroundColor = [UIColor whiteColor];
        _textView.delegate = self;
    }
    return _textView;
}

-(UILabel *)leftcharNumLabel{
    
    if (!_leftcharNumLabel) {
        _leftcharNumLabel = [[UILabel alloc] init];
        _leftcharNumLabel.text = @"您还可以输入500字";
        _leftcharNumLabel.textAlignment = [PUUtil getTextAlign:TextAlignTypeCenter];
        [_leftcharNumLabel setFont:[UIFont systemFontOfSize:14.0]];
        [_leftcharNumLabel setTextColor:[UIColor colorWithWhite:0.3 alpha:0.5]];;
        _leftcharNumLabel.width = 140;
        _leftcharNumLabel.height = 18;
        
        _leftcharNumLabel.right = self.textView.right-5;
        _leftcharNumLabel.bottom  = self.textView.bottom-5;

    }
    return _leftcharNumLabel;
}

-(UILabel *)placeHold{
    
    if (!_placeHold) {
        _placeHold = [[UILabel alloc] init];
        [_placeHold setBackgroundColor:[UIColor clearColor]];
        [_placeHold setFont:[UIFont systemFontOfSize:16.0]];
        [_placeHold setTextColor:[UIColor colorWithWhite:0.1 alpha:0.5]];
        [_placeHold setText:@"输入评论"];
        if([[[UIDevice currentDevice] systemVersion] floatValue]< 7.0){
            _placeHold.left = _textView.left+11;
        }else{
            _placeHold.left = _textView.left+6;
        }
        _placeHold.top  = _textView.top+4;
        _placeHold.width = 135;
        _placeHold.height = 23;

    }
    return _placeHold;
}


-(UIButton *)sendCommitBtn{
    
    if (!_sendCommitBtn) {
        _sendCommitBtn = [[UIButton alloc] init];
        _sendCommitBtn.width = 188;
        _sendCommitBtn.height = 30;
        _sendCommitBtn.centerX = SCREEN_WIDTH/2;
        _sendCommitBtn.top = self.textView.bottom +30;
        [_sendCommitBtn setTitle:@"发表意见" forState:UIControlStateNormal];
        _sendCommitBtn.titleLabel.font = FONT_TITLE(kFont_Size_14);
        _sendCommitBtn.enabled = NO;
        _sendCommitBtn.backgroundColor = kApp_Corlor_8;
        [_sendCommitBtn addTarget:self action:@selector(sendCommit) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _sendCommitBtn;
}

@end
