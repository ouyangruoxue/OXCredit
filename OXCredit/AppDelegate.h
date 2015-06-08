//
//  AppDelegate.h
//  OXCredit
//
//  Created by zuo xiaolin on 15/6/5.
//  Copyright (c) 2015年 zuo xiaolin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomNavigationController.h"
#import "CustomTabBarController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) CustomNavigationController *rootNaviController;
+ (AppDelegate*)appDelegate;
@end

