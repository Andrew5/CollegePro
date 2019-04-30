//
//  Constants.h
//  ZLYDoc
//  系统常量
//  Created by Ryan on 14-4-14.
//  Copyright (c) 2014年 ZLY. All rights reserved.
//

#import <Foundation/Foundation.h>

//COLOR
#define COLOR_MAIN @"#pznaer_db"

//APP INFO
#define APP_NAME @"在那儿公众版"
#define VERSION @"v0.1.0"
#define COPYRIGHT @"Copyright @2014 ZLYCARE All Rights Reserved"

//FONT SIZE
#define FONT_SIZE 15.0f

/// NSError userInfo key that will contain response data
#define JSONResponseSerializerWithDataKey @"JSONResponseSerializerWithDataKey"

//Notification key
#define k_NOTI_NETWORK_ERROR @"k_NOTI_NETWORK_ERROR"        //网络异常
#define k_NOTI_VERSION_UPDATE @"k_NOTI_VERSION_UPDATE"      //版本更新通知


//UserDefaults
#define k_UD_IMG_TOKEN @"k_UD_IMG_TOKEN"                    //七牛图片上传token
#define k_UD_IMG_URL @"k_UD_IMG_URL"                        //七牛图片下载url

//信息提示
#define TEXT_NETWORK_ERROR @"网络异常，请检查网络连接"
#define TEXT_SERVER_NOT_RESPOND @"服务器或网络异常,请稍后重试"

//百度地图key
#define BAIDU_MAP_KEY @"nItGCNGyq4LDElOx4bV5N1e9"

#define TOKEN @"d5bde5d1-eab7-4327-aa82-60f445e161d9"

//数据库版本号
#define DB_VERSION @"1"
//数据库名称
#define DB_NAME @"publicznaer.db"
//联系人表
#define DB_TABLE_CONTACT @"DB_TABLE_CONTACT"
//好友申请审核临时表
#define DB_TABLE_TEMP_AUDIT @"DB_TABLE_TEMP_AUDIT"

//信鸽推送
#define XG_ACCESS_ID 2200091811
#define XG_ACCESS_KEY @"I4R8KHU1X96C"
#define XG_UNREGISTER_KEY @"UnRegisterDevice"

#define UMENG_APP_KEY @"54fd0ef1fd98c554d7000c7e"



#define SHOW_FRIEND_LOCATION @"show_friend_location"

@interface Constants : NSObject

@end
