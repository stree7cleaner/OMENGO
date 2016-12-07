//
//  Storage.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/6.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "Storage.h"
#import "MainConfigure.h"
#import <YYCache.h>
#import <YYImageCache.h>
static NSString * const KAuthorizationToken = @"KAuthorizationToken";
static NSString * const KAuthorizationUserID = @"KAuthorizationUserID";

static NSString * const kUserAccountKey = @"user_account";

NSString * const KTLoginSuccessNotificationKey = @"LoginSuccess";           //成功登录通知码


//用户信息key
NSString * const kUsernameKey = @"UserAccountKey";
NSString * const kUserPasswordKey = @"UserPasswordKey";
#define FileManager [NSFileManager defaultManager]


@implementation Storage
{
    id _authorizationToken;
}
static Storage * shareInstance = nil;

+ (instancetype)shareInstance{

    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{

        shareInstance = [[self alloc] init];

    });

    return shareInstance;
}


- (void)setAccount:(id)account
{
    SMUserDefaultSet(kUserAccountKey, [account mj_keyValues]);
    SMNotificationPost(KTLoginSuccessNotificationKey, nil);
}

- (id)account
{
    if (![self.class isLogin]) {
        return nil;
    }
    NSDictionary *dic = SMUserDefaultGet(kUserAccountKey);
    return [NSObject mj_objectWithKeyValues:dic];
}


+ (BOOL)isLogin
{
    return [SMUserDefaultGet(@"IS_LOGIN") boolValue];

}

- (void)setUsername:(NSString *)userAccount
{
    SMUserDefaultSet(kUsernameKey,userAccount);
}

- (NSString *)username
{
    return SMUserDefaultGet(kUsernameKey);
}


- (void)setUserPassword:(NSString *)userPassword
{
    SMUserDefaultSet(kUserPasswordKey, userPassword);
}

- (NSString *)userPassword
{
    return SMUserDefaultGet(kUserPasswordKey);
}

+ (void)saveAuthorizationToken:(NSString *)token{

    if(token == nil||[token isEqualToString:@""]) {
        [SMUserDefault removeObjectForKey:KAuthorizationToken];
        [SMUserDefault synchronize];
        return;

    }
    SMUserDefaultSet(KAuthorizationToken,token);
}

+ (NSString *)authorizationToken
{
    return SMUserDefaultGet(KAuthorizationToken);
}


+ (void)removeImageMemoryCache
{
    [[YYImageCache sharedCache].memoryCache removeAllObjects];
}

@end
