//
//  HXDCity.m
//  省市选择
//
//  Created by huxuedong on 15/9/29.
//  Copyright © 2015年 胡学东. All rights reserved.
//

#import "HXDCity.h"

@implementation HXDCity

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)provinceWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
