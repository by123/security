//
//  HttpRequest.m
//  security
//
//  Created by by.huang on 2017/4/7.
//  Copyright © 2017年 by.huang. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest



+(void)get : (NSString *)url params : (NSMutableDictionary *)params success : (OnSuccess)success fail : (OnFail) fail
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
}


+(void)post : (NSString *)url params : (NSMutableDictionary *)params success : (OnSuccess)success fail : (OnFail) fail
{
    [self post:url params:params success:success fail:fail progress:nil];
}


+(void)post : (NSString *)url params : (NSMutableDictionary *)params success : (OnSuccess)success fail : (OnFail) fail progress : (OnProgress) progress
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        if(progress){
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
}



@end
