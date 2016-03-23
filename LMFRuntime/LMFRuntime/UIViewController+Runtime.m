//
//  UIViewController+Runtime.m
//  LMFRuntime
//
//  Created by lumf on 16/3/23.
//  Copyright © 2016年 lumf. All rights reserved.
//

#import "UIViewController+Runtime.h"
#import <objc/runtime.h>

@implementation UIViewController (Runtime)
+(void)load{
    Method method1 = class_getClassMethod(self, @selector(lmf_dealloc));
    Method method2 = class_getClassMethod(self, NSSelectorFromString(@"dealloc"));
    
    method_exchangeImplementations(method1, method2);
}

-(void)dealloc{
    NSLog(@"why----");
}

-(void)lmf_dealloc{
    NSLog(@"lmf_dealloc");
    [self lmf_dealloc];
}

@end
