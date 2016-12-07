//
//  Storage.h
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/6.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "BaseModel.h"

#define KTSystemStorageSingleton [KTSystemStorage shareInstance]
@interface Storage : BaseModel

@property (nonatomic, strong) id account;
@property (copy, nonatomic) NSString    *username;
@property (copy, nonatomic) NSString    *userPassword;

/**  是否已经登录  */
+ (BOOL)isLogin;


+ (instancetype)shareInstance;


/**  save Token  */
+ (void)saveAuthorizationToken:(NSString *)token;


/** get Token **/
+ (NSString *)authorizationToken;

+ (void)removeImageMemoryCache;

@end
