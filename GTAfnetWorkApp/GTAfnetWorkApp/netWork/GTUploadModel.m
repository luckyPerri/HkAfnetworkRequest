//
//  GTUploadModel.m
//  GTAfnetWorkApp
//
//  Created by zhaoke.hzk on 17/3/23.
//  Copyright © 2017年 TSAPP. All rights reserved.
//

#import "GTUploadModel.h"

@implementation GTUploadModel

+(GTUploadModel* )modelWithFilePath:(NSString* )filePath name:(NSString* )name fileName:(NSString* )fileName mineType:(NSString* )mineType{
    GTUploadModel* model = [GTUploadModel new];
    model.filePath = filePath;
    model.name = name;
    model.fileName = fileName;
    model.mineType = mineType;
    return model;
    
    
}

+(GTUploadModel* )modelWithFileData:(NSData* )filedata name:(NSString* )name fileName:(NSString* )fileName mineType:(NSString* )mineType{
    
    GTUploadModel* model = [GTUploadModel new];
    model.fileData = filedata;
    model.name = name;
    model.fileName = fileName;
    model.mineType = mineType;
    return model;
    
}

@end
