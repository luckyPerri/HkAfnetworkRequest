//
//  GTNetWorkConfigInfo.h
//  GTAfnetWorkApp
//
//  Created by zhaoke.hzk on 17/2/17.
//  Copyright © 2017年 TSAPP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTBaseService.h"
#import "GTUploadModel.h"

typedef NS_ENUM(NSInteger , GTRequestType) {
    GTRequestTypeGet,
    GTRequestTypePost,
    GTRequestTypeHead,
    GTRequestTypePut,
    GTRequestTypeDelete,
};

@interface GTNetWorkConfigInfo : NSObject

@property (nonatomic , assign)GTServiceType serviceType;
@property (nonatomic , assign)GTRequestType type;
@property (nonatomic , copy)NSString* urlPath;

@property (nonatomic , assign)BOOL isHttps;

@property (nonatomic , strong)NSDictionary* headers;

@property (nonatomic , strong)NSDictionary* baseParams;

@property (nonatomic , strong)NSDictionary* requestParams;

-(NSDictionary* )concreteRequestHeaders;
-(NSDictionary* )concreteRequestParams;


+ (GTNetWorkConfigInfo* )configInfoWithServiceType:(GTServiceType )serviceType requestType:(GTRequestType)type urlPath:(NSString* )urlPath isHttps:(BOOL)isHttps headers:(NSDictionary* )headers baseParams:(NSDictionary* )baseParams requestParams:(NSDictionary* )requestParams;
+ (GTNetWorkConfigInfo* )configInfoWithServiceType:(GTServiceType )serviceType requestType:(GTRequestType)type urlPath:(NSString* )urlPath isHttps:(BOOL)isHttps baseParams:(NSDictionary* )baseParams requestParams:(NSDictionary* )requestParams;
+ (GTNetWorkConfigInfo* )configInfoWithServiceType:(GTServiceType )serviceType requestType:(GTRequestType)type urlPath:(NSString* )urlPath isHttps:(BOOL)isHttps requestParams:(NSDictionary* )requestParams;
+ (GTNetWorkConfigInfo* )configInfoWithServiceType:(GTServiceType )serviceType requestType:(GTRequestType)type urlPath:(NSString* )urlPath requestParams:(NSDictionary* )requestParams;




@end

@interface GTNetWorkUploadConfigInfo : GTNetWorkConfigInfo

@property (nonatomic , strong)NSArray<GTUploadModel* >* uploadParams;
-(NSArray * )concreteUploadParams;
+ (GTNetWorkConfigInfo* )configInfoWithServiceType:(GTServiceType )serviceType requestType:(GTRequestType)type urlPath:(NSString* )urlPath isHttps:(BOOL)isHttps headers:(NSDictionary* )headers baseParams:(NSDictionary* )baseParams requestParams:(NSDictionary* )requestParams uploadParams:(NSArray<GTUploadModel*> *)uploadParams;

@end

