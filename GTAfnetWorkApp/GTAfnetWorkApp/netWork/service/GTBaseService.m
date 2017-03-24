//
//  GTBaseService.m
//  GTAfnetWorkApp
//
//  Created by zhaoke.hzk on 2017/2/16.
//  Copyright © 2017年 TSAPP. All rights reserved.
//

#import "GTBaseService.h"

@implementation GTBaseService
static GTBaseService* currentService = nil;

+(GTBaseService* )currentService{
        static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSInteger enviormentType = [[NSUserDefaults standardUserDefaults] integerForKey:@"environmentType"];
        if (enviormentType == 0) {
            enviormentType = GTEnviromentTypeOnline;
        }
        currentService = [self serviceWithType:enviormentType];
        
    });
    return currentService;
}


+(GTBaseService* )serviceWithType:(GTEnviromentType)type{
    
    switch (type) {
        case GTEnviromentTypeDebug:
            currentService = [GTDebugService new];
            break;
            case GTEnviromentTypeTest:
            currentService = [GTTestService new];
            break;
            case GTEnviromentTypePrefig:
            currentService = [GTPrefigService new];
            break;
            case GTEnviromentTypeOnline:
            currentService = [GTOnlineService new];
            break;
        default:
            currentService = [GTOnlineService new];
            break;
    }
    return currentService;
}

-(void)switchToEnviroment:(GTEnviromentType)type{
    currentService = [[self class] serviceWithType:type];
}


-(NSString* )baseUrlWithEviromentType:(GTServiceType)type{
    NSString* baseUrl;
    switch (type) {
        case GTServiceTypex:
            baseUrl = [self serverx];
            break;
        case GTServiceTypey:
            baseUrl = [self servery];
            break;
        case GTServiceTypez:
            baseUrl = [self serverz];
            break;
        default:
            baseUrl = [self serverx];
            break;
    }
    
    return baseUrl;
}


-(NSString* )serverx{
    return @"";
}
-(NSString* )servery{
    return @"";
}
-(NSString* )serverz{
    return @"";
}

@end

@implementation GTDebugService

-(NSString* )serverx{
    return @"";
}
-(NSString* )servery{
    return @"";
}
-(NSString* )serverz{
    return @"";
}
@end

@implementation GTTestService

-(NSString* )serverx{
    return @"";
}
-(NSString* )servery{
    return @"";
}
-(NSString* )serverz{
    return @"";
}

@end

@implementation GTPrefigService

-(NSString* )serverx{
    return @"";
}
-(NSString* )servery{
    return @"";
}
-(NSString* )serverz{
    return @"";
}
@end

@implementation GTOnlineService

-(NSString* )serverx{
    return @"";
}
-(NSString* )servery{
    return @"";
}
-(NSString* )serverz{
    return @"";
}

@end

