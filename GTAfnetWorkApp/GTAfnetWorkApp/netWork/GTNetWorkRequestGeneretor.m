//
//  GTNetWorkRequestGeneretor.m
//  GTAfnetWorkApp
//
//  Created by zhaoke.hzk on 17/2/17.
//  Copyright © 2017年 TSAPP. All rights reserved.
//

#import "GTNetWorkRequestGeneretor.h"
#import <AFNetworking.h>

@implementation GTNetWorkRequestGeneretor



+(NSMutableURLRequest* )generateRequestWithConfigInfo:(GTNetWorkConfigInfo* )configInfo{
    
    
    NSString* baseUrl = [self urlPathWithPath:configInfo.urlPath useHttps:configInfo.isHttps serviceType:configInfo.serviceType];
    AFJSONRequestSerializer* requestSerializer = [AFJSONRequestSerializer new];
    NSString* method = (configInfo.type == GTRequestTypeGet)?@"GET":@"POST";
    NSMutableURLRequest* request = [requestSerializer requestWithMethod:method URLString:baseUrl parameters:[self requestParamsWithConfigInfo:configInfo] error:nil];
    [configInfo.headers enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                [request setValue:obj forHTTPHeaderField:key];
            }];
    
    return request;
}

+(NSMutableURLRequest* )generateUploadMutilRequestWithConfigInfo:(GTNetWorkUploadConfigInfo* )configInfo{
    NSString* baseUrl = [self urlPathWithPath:configInfo.urlPath useHttps:configInfo.isHttps serviceType:configInfo.serviceType];
    AFJSONRequestSerializer* requestSerializer = [AFJSONRequestSerializer new];
    NSString* method = (configInfo.type == GTRequestTypeGet)?@"GET":@"POST";
    NSMutableURLRequest* request = [requestSerializer multipartFormRequestWithMethod:method URLString:baseUrl parameters:[self requestParamsWithConfigInfo:configInfo] constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSArray<GTUploadModel *>* fileArr = configInfo.uploadParams;

        [fileArr enumerateObjectsUsingBlock:^(GTUploadModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
            if (obj.filePath) {
                
                [formData appendPartWithFileURL:[NSURL URLWithString:obj.filePath] name:obj.name?:@"file" fileName:obj.fileName?:@"file.jpg" mimeType:obj.mineType?:@"img/jpg" error:nil];
                
                
            }else if (obj.fileData){
                [formData appendPartWithFileData:obj.fileData name:obj.name?:@"file" fileName:obj.fileName?:@"file.jpg" mimeType:obj.mineType?:@"img/jpg"];
            }
        }];
        
    } error:nil];
    [configInfo.headers enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [request setValue:obj forHTTPHeaderField:key];
    }];
    return request;
}




+(NSDictionary* )requestParamsWithConfigInfo:(GTNetWorkConfigInfo* )configInfo{
    NSMutableDictionary* requestParams = [NSMutableDictionary dictionary];
    if (configInfo.baseParams&&[configInfo.baseParams isKindOfClass:[NSDictionary class]]) {
        [requestParams addEntriesFromDictionary:configInfo.baseParams];
    }
    NSDictionary* otherParams = [configInfo concreteRequestParams];
    if (otherParams&&[otherParams isKindOfClass:[NSDictionary class]]) {
        [requestParams addEntriesFromDictionary:otherParams];
    }
    
    return [requestParams copy];
}

+(NSString* )urlPathWithPath:(NSString* )urlPath useHttps:(BOOL )isHttps serviceType:(GTServiceType )serviceType{
    
    if ([urlPath hasPrefix:@"http"]) {
        return [urlPath stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    }else{
     
        NSString* baseUrl = [[GTBaseService currentService] baseUrlWithEviromentType:serviceType];
        
        if (isHttps&&urlPath.length>4) {
            NSMutableString* mutableStr = [NSMutableString stringWithString:baseUrl];
            [mutableStr insertString:@"s" atIndex:4];
            baseUrl = [mutableStr copy];
        }
        return [NSString stringWithFormat:@"%@%@",baseUrl,[urlPath stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]]];
    }
}
@end
