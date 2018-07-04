//
//  JLRoutes+GenerateURL.m
//  MVVMRAC
//
//  Created by zhangguangpeng on 2018/6/27.
//  Copyright © 2018年 zhangguangpeng. All rights reserved.
//

#import "JLRoutes+GenerateURL.h"
#import <JLRoutes/JLRRouteRequest.h>
#import <JLRoutes/JLRRouteDefinition.h>
#import "WDRouterConstant.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ReactiveObjC/ReactiveObjC.h"

@interface JLRRouteDefinition (kExtension)

- (NSString *)variableNameForValue:(NSString *)value;
- (NSString *)variableValueForValue:(NSString *)value decodePlusSymbols:(BOOL)decodePlusSymbols;

@end


@implementation JLRoutes (GenerateURL)

+ (NSString *)fk_generateURLWithPattern:(NSString *)pattern parameters:(NSArray *)parameters
{
    return [[self class] wd_generateURLWithPattern:pattern parameters:parameters extraParameters:nil];
}

+ (NSString *)wd_generateURLWithPattern:(NSString *)pattern parameters:(NSArray *)parameters extraParameters:(NSDictionary *)extraParameters
{
    // 创建路由
    JLRRouteDefinition *route = [[JLRRouteDefinition alloc] initWithScheme:@"" pattern:pattern priority:0 handlerBlock:nil];
    
    NSArray *patternComponents;
    @try {
        patternComponents = [route mutableArrayValueForKeyPath:@"patternComponents"];
    } @catch (NSException *exception) {
        return nil;
    } @finally {
    }
    
    NSUInteger index = 0;
    NSMutableArray *routeValues = [NSMutableArray array];
    for (NSString *patternComponent in patternComponents) {
        
        NSString *URLComponent = nil;
        if (index < [parameters count]) {
            URLComponent = parameters[index];
        } else if ([patternComponent isEqualToString:@"*"]) {
            // match /foo by /foo/*
            URLComponent = [parameters lastObject];
        }
        
        if ([patternComponent hasPrefix:@":"]) {
            // 匹配到了一个值
            @try {
                NSString *variableValue = [route variableValueForValue:URLComponent decodePlusSymbols:NO];
                [routeValues addObject:variableValue];
            } @catch (NSException *exception) {}
            index++;
        }else if ([patternComponent isEqualToString:@"*"]){
            // 模糊匹配
            NSUInteger minRequiredParams = index;
            if (parameters.count >= minRequiredParams) {
                // match: /a/b/c/* has to be matched by at least /a/b/c
                [routeValues addObjectsFromArray:[parameters subarrayWithRange:NSMakeRange(index, parameters.count - index)]];
            }
        }else
        {
            // 静态参数值
            [routeValues addObject:patternComponent];
        }
    }
    
    if (routeValues && routeValues.count) {
        
        NSString *urlPath = [routeValues componentsJoinedByString:@"/"];
        return [NSString stringWithFormat:@"/%@%@", urlPath, [self wd_mapDictionaryToURLQueryString:extraParameters]];
    }
    return nil;
}

+ (NSDictionary *)wd_parseParamsWithURL:(NSURL *)URL
{
    NSString *parameterString = URL.query;
    NSMutableDictionary *parameterDic = [NSMutableDictionary new];
    if (parameterString && parameterString.length > 0) {
        
        NSArray *kvPart = [parameterString componentsSeparatedByString:@"&"];
        for (NSString * kv in kvPart) {
            
            NSArray *kvArr = [kv componentsSeparatedByString:@"="];
            if (kvArr.count == 2) {
                
                [parameterDic setObject:[kvArr lastObject] forKey:[kvArr firstObject]];
            }
        }
        
    }
    return [NSDictionary dictionaryWithDictionary:parameterDic];
}

+ (NSString *)wd_mapDictionaryToURLQueryString:(NSDictionary *)dic
{
    if (!dic) {
        return @"";
    }
    NSURLComponents *components = [[NSURLComponents alloc] init];
    NSMutableArray *queryItems = [NSMutableArray array];
    
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSString *queryKey = [NSString stringWithFormat:@"%@", key];
        NSString *queryValue = [NSString stringWithFormat:@"%@", obj];
        NSURLQueryItem *item = [NSURLQueryItem queryItemWithName:queryKey value:queryValue];
        [queryItems addObject:item];
    }];
    components.queryItems = [queryItems copy];
    
    return components.URL.absoluteString;
}

+ (void)wd_goController:(NSString *)controller WithPattern:(NSString *)pattern {
    
    [[RACScheduler mainThreadScheduler] schedule:^{
        NSString *router = [JLRoutes wd_generateURLWithPattern:pattern parameters:@[controller] extraParameters:@{@"key":@"2"}];
        NSLog(@"JLRGenRouteURL=%@",JLRGenRouteURL(WDDefaultRouteSchema, router));
        [JLRoutes routeURL:JLRGenRouteURL(WDDefaultRouteSchema, router)];
    }];
}

@end
