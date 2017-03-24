//
//  GTNetWorkRequestGeneretor.h
//  GTAfnetWorkApp
//
//  Created by zhaoke.hzk on 17/2/17.
//  Copyright © 2017年 TSAPP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GTNetWorkConfigInfo.h"

@interface GTNetWorkRequestGeneretor : NSObject

+(NSMutableURLRequest* )generateRequestWithConfigInfo:(GTNetWorkConfigInfo* )configInfo;

+(NSMutableURLRequest* )generateUploadMutilRequestWithConfigInfo:(GTNetWorkUploadConfigInfo* )configInfo;
@end
