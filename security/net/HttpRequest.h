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

+(void)get : (NSString *_Nonnull)url params : (NSMutableDictionary *_Nullable)params success : (OnSuccess _Nullable)success fail : (OnFail _Nullable) fail;

+(void)post : (NSString *_Nonnull)url params : (NSMutableDictionary *_Nullable)params success : (OnSuccess _Nullable)success fail : (OnFail _Nullable) fail;

+(void)post : (NSString *_Nonnull)url params : (NSMutableDictionary *_Nullable)params success : (OnSuccess _Nullable)success fail : (OnFail _Nullable) fail progress : (OnProgress _Nullable) progress;


@end
