//
//  GTNetWorkConfigInfo.m
//  GTAfnetWorkApp
//
//  Created by zhaoke.hzk on 17/2/17.
//  Copyright © 2017年 TSAPP. All rights reserved.
//

#import "GTNetWorkConfigInfo.h"

@implementation GTNetWorkConfigInfo

-(NSDictionary* )concreteRequestHeaders{
    
    return self.headers;
}
-(NSDictionary* )concreteRequestParams{
    return self.requestParams;
}
+ (GTNetWorkConfigInfo* )configInfoWithServiceType:(GTServiceType )serviceType requestType:(GTRequestType)type urlPath:(NSString* )urlPath isHttps:(BOOL)isHttps headers:(NSDictionary* )headers baseParams:(NSDictionary* )baseParams requestParams:(NSDictionary* )requestParams{
    GTNetWorkConfigInfo* configInfo = [GTNetWorkConfigInfo new];
    configInfo.serviceType = serviceType;
    configInfo.type = type;
    configInfo.urlPath = urlPath;
    configInfo.isHttps = isHttps;
    configInfo.headers = headers;
    configInfo.baseParams = baseParams;
    configInfo.requestParams = requestParams;
    
    return configInfo;
}
+ (GTNetWorkConfigInfo* )configInfoWithServiceType:(GTServiceType )serviceType requestType:(GTRequestType)type urlPath:(NSString* )urlPath isHttps:(BOOL)isHttps baseParams:(NSDictionary* )baseParams requestParams:(NSDictionary* )requestParams{
    return [self configInfoWithServiceType:serviceType requestType:type urlPath:urlPath isHttps:isHttps headers:nil baseParams:baseParams requestParams:requestParams];
}
+ (GTNetWorkConfigInfo* )configInfoWithServiceType:(GTServiceType )serviceType requestType:(GTRequestType)type urlPath:(NSString* )urlPath isHttps:(BOOL)isHttps requestParams:(NSDictionary* )requestParams{
    return [self configInfoWithServiceType:serviceType requestType:type urlPath:urlPath isHttps:isHttps baseParams:nil requestParams:requestParams];
}
+ (GTNetWorkConfigInfo* )configInfoWithServiceType:(GTServiceType )serviceType requestType:(GTRequestType)type urlPath:(NSString* )urlPath requestParams:(NSDictionary* )requestParams{
    
    return  [self configInfoWithServiceType:serviceType requestType:type urlPath:urlPath isHttps:NO baseParams:nil requestParams:requestParams];
}

@end


@implementation GTNetWorkUploadConfigInfo
-(NSArray * )concreteUploadParams{
    return self.uploadParams;
}


+ (GTNetWorkConfigInfo* )configInfoWithServiceType:(GTServiceType )serviceType requestType:(GTRequestType)type urlPath:(NSString* )urlPath isHttps:(BOOL)isHttps headers:(NSDictionary* )headers baseParams:(NSDictionary* )baseParams requestParams:(NSDictionary* )requestParams uploadParams:(NSArray<GTUploadModel*> *)uploadParams{
    GTNetWorkUploadConfigInfo* configInfo = [GTNetWorkUploadConfigInfo new];
    configInfo.serviceType = serviceType;
    configInfo.type = type;
    configInfo.urlPath = urlPath;
    configInfo.isHttps = isHttps;
    configInfo.headers = headers;
    configInfo.baseParams = baseParams;
    configInfo.requestParams = requestParams;
    configInfo.uploadParams = uploadParams;
    return configInfo;

}

@end
