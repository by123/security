//
//  HttpRequest.h
//  security
//
//  Created by by.huang on 2017/4/7.
//  Copyright © 2017年 by.huang. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^OnSuccess)(id  _Nullable responseObject);

typedef void (^OnFail)(NSError * _Nonnull error);

typedef void (^OnProgress)(NSProgress * _Nonnull uploadProgress);

@interface HttpRequest : NSObject

#pragma mark get请求
+(void)get : (NSString *_Nonnull)url params : (NSMutableDictionary *_Nullable)params success : (OnSuccess _Nullable)success fail : (OnFail _Nullable) fail;

#pragma mark post请求（不带进度）
+(void)post : (NSString *_Nonnull)url params : (NSMutableDictionary *_Nullable)params success : (OnSuccess _Nullable)success fail : (OnFail _Nullable) fail;

#pragma mark post请求（带进度）
+(void)post : (NSString *_Nonnull)url params : (NSMutableDictionary *_Nullable)params success : (OnSuccess _Nullable)success fail : (OnFail _Nullable) fail progress : (OnProgress _Nullable) progress;

#pragma mark post请求（上传json字符串）
+(void)post : (NSString *_Nonnull)url json : (NSString *_Nullable)jsonStr success : (OnSuccess _Nullable)success fail : (OnFail _Nullable) fail;

#pragma mark 下载
+(void)download : (NSString *_Nonnull)downUrl;


#pragma mark 上传
+(void)upload : (NSString *_Nonnull)uploadUrl path : (NSURL *_Nonnull)filePath;


@end
