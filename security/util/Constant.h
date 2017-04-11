//
//  Constant.h
//  security
//
//  Created by by.huang on 2017/4/7.
//  Copyright © 2017年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UILabel+ContentSize.h"
#import "UIView+Frame.h"
#import "ColorUtil.h"
#import "TimeUtil.h"
#import "DialogHelper.h"
#import "HttpRequest.h"


#define BAIDU_AK  @"mMrFYCGKUh5KUI5hgKS1WfTDESioqVGH"
#define BACKGROUND_COLOR [UIColor whiteColor]




//NavBar高度
#define StatuBar_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height
#define NavigationBar_HEIGHT     44

//去除状态栏和导航栏的frame
#define Default_Frame  CGRectMake(0, StatuBar_HEIGHT + NavigationBar_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - (StatuBar_HEIGHT + NavigationBar_HEIGHT))

//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen  mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//-------------------检查nil-------------------------
#define IS_NS_COLLECTION_EMPTY(collection) (collection == nil || [collection count] == 0)

#define IS_NS_STRING_EMPTY(str) (str == nil || [str isEqualToString:@""])


//------------------------------------------------
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

@interface Constant : NSObject

@end
