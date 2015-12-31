//
//  HXDCity.h
//  省市选择
//
//  Created by huxuedong on 15/9/29.
//  Copyright © 2015年 胡学东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HXDCity : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray *cities;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)provinceWithDict:(NSDictionary *)dict;

@end
