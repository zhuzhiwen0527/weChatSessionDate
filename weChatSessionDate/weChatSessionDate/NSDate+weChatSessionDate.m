//
//  NSDate+weChatSessionDate.m
//  weChatSessionDate
//
//  Created by apple on 2018/3/20.
//  Copyright © 2018年 zzw. All rights reserved.
//

#import "NSDate+weChatSessionDate.h"

@implementation NSDate (weChatSessionDate)
+ (NSDate *)dateString:(NSString *)dateString WithFormate:(NSString *)formate
{
    NSDateFormatter *dataformate= [[NSDateFormatter alloc]init];
    dataformate.dateFormat = formate;
    return [dataformate dateFromString:dateString];
}


+ (NSString *)date:(NSDate *)date WithFormate:(NSString *)formate
{
    NSDateFormatter *dataformate= [[NSDateFormatter alloc]init];
    dataformate.dateFormat = formate;
    return [dataformate stringFromDate:date];
    
}

+(NSString *)compareDate:(NSDate *)date specificDateFormate:(NSString*)formate{
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *today = [NSDate date];
    
    NSMutableArray *dateStrArr = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 7; i++) {
        [dateStrArr addObject:[self date:[today dateByAddingTimeInterval:-secondsPerDay * i] WithFormate:@"YYYY-MM-dd"]];
    }
    
    NSString * dateString = [self date:date WithFormate:@"YYYY-MM-dd"];
    if ([dateStrArr containsObject:dateString]) {
        
        switch ([dateStrArr indexOfObject:dateString]) {
            case 0:
            {
                return [NSDate date:date WithFormate:@"a hh:mm"];
            }
                break;
            case 1:
            {
                return formate ? [NSString stringWithFormat:@"昨天 %@",[NSDate date:date WithFormate:formate]] :@"昨天";
            }
                break;
                
            default:
            {
                return  formate ?[NSString stringWithFormat:@"%@ %@",[self getWeekDayFordate:date],[NSDate date:date WithFormate:formate]] :[NSString stringWithFormat:@"%@",[self getWeekDayFordate:date]];
            }
                break;
        }
    }else{
        
        return [NSDate date:date WithFormate:formate ? @"YYYY年M月d日 a hh:mm":@"YYYY年M月d日"];
        
    }

}
+ (NSString *)getWeekDayFordate:(NSDate*)date
{
    NSArray *weekday = [NSArray arrayWithObjects: [NSNull null], @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:NSWeekdayCalendarUnit fromDate:date];
    
    NSString *weekStr = [weekday objectAtIndex:components.weekday];
    return weekStr;
}
@end
