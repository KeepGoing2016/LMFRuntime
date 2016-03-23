//
//  ViewController.m
//  LMFRuntime
//
//  Created by lumf on 16/3/23.
//  Copyright © 2016年 lumf. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>
#import "Dog.h"
#import "UIViewController+Runtime.h"
#import "LMFViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Method method1 = class_getClassMethod([Person class], @selector(run));
    Method method2 = class_getClassMethod([Person class], @selector(eat));
    Method method3 = class_getClassMethod([Dog class], @selector(sleep));
    
    //改方法只是交换了方法里面的内容，调用的还是原来的方法
    method_exchangeImplementations(method2, method1);  //执行后1指向2的代码块；2指向1的代码块
    method_exchangeImplementations(method2, method3);  //执行后2指向3的代码块；3指向2指向的代码块（即原来1的代码块）
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [Person run]; //执行method2
    [Person eat]; //执行method3
    [Dog sleep];  //执行的是method1
    
//    UIViewController *topVC = [[UIViewController alloc]init];
//    topVC.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1.0];
//    [self presentViewController:topVC animated:YES completion:^{
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [topVC dismissViewControllerAnimated:YES completion:^{
//                NSLog(@"topVC:%@",topVC);
//            }];
//        });
//    }] ;
    
    LMFViewController *lmfVC = [[LMFViewController alloc]init];
    [self presentViewController:lmfVC animated:YES completion:^{
        
    }];
}

-(void)dealloc{
    NSLog(@"dealloc----");
}

@end
