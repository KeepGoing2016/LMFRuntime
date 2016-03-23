//
//  LMFViewController.m
//  LMFRuntime
//
//  Created by lumf on 16/3/23.
//  Copyright © 2016年 lumf. All rights reserved.
//

#import "LMFViewController.h"

@implementation LMFViewController
-(void)viewDidLoad{
     self.view.backgroundColor=[UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1.0];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)dealloc{
    NSLog(@"lmfVC--dealloc----");
}
@end
