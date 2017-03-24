//
//  GTUploadModel.h
//  GTAfnetWorkApp
//
//  Created by zhaoke.hzk on 17/3/23.
//  Copyright © 2017年 TSAPP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GTUploadModel : NSObject

/**
 *  FileData:要上传的文件的二进制数据
 *  name:上传参数名称
 *  fileName：上传到服务器的文件名称
 *  mimeType：文件类型  @"image/jpg/png/jpeg"
 *  uploadParam:数据模型(NSObject)存有每个图片的二进制，上传服务器对应的Key参数，文件名字，文件类型
 */

@property (nonatomic , strong)NSData* fileData;
@property (nonatomic , strong)NSString* filePath;
@property (nonatomic , strong)NSString* name;
@property (nonatomic , strong)NSString* fileName;
@property (nonatomic , strong)NSString* mineType;

+(GTUploadModel* )modelWithFilePath:(NSString* )filePath name:(NSString* )name fileName:(NSString* )fileName mineType:(NSString* )mineType;

+(GTUploadModel* )modelWithFileData:(NSData* )filedata name:(NSString* )name fileName:(NSString* )fileName mineType:(NSString* )mineType;

@end
