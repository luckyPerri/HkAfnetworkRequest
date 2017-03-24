//
//  GTBaseService.h
//  GTAfnetWorkApp
//
//  Created by zhaoke.hzk on 2017/2/16.
//  Copyright © 2017年 TSAPP. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger , GTEnviromentType) {
    GTEnviromentTypeDebug = 1,
    GTEnviromentTypeTest = 2,
    GTEnviromentTypePrefig =3,
    GTEnviromentTypeOnline = 4,
};
typedef NS_ENUM(NSInteger , GTServiceType) {
    GTServiceTypex,
    GTServiceTypey,
    GTServiceTypez,
};




@interface GTBaseService : NSObject

+(GTBaseService* )currentService;
-(NSString* )baseUrlWithEviromentType:(GTServiceType)type;
-(void)switchToEnviroment:(GTEnviromentType)type;


-(NSString* )serverx;
-(NSString* )servery;
-(NSString* )serverz;

@end


@interface GTDebugService : GTBaseService

@end

@interface GTTestService : GTBaseService

@end

@interface GTPrefigService : GTBaseService

@end

@interface GTOnlineService : GTBaseService

@end
