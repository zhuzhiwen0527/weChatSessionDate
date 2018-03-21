//
//  NSDate+weChatSessionDate.h
//  weChatSessionDate
//
//  Created by apple on 2018/3/20.
//  Copyright © 2018年 zzw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (weChatSessionDate)
+ (NSDate *)dateString:(NSString *)dateString WithFormate:(NSString *)formate;
+ (NSString *)date:(NSDate *)date WithFormate:(NSString *)formate;

/**
 微信会话页面时间计算

 @param date 传入消息时间
 @param formate 显示具体时间的formate 传入@"a hh:mm" eg:昨天 下午 1：23  传入nil eg:昨天
 @return 日期字符串
 */
+(NSString *)compareDate:(NSDate *)date specificDateFormate:(NSString*)formate;
@end
