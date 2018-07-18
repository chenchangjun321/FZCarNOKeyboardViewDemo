//
//  ViewController.m
//  FZCarNOKeyboardView
//
//  Created by xiehewanbang on 2018/7/17.
//  Copyright © 2018年 xiehewanbang. All rights reserved.
//

#import "ViewController.h"
#import "FZDefineKeyBoardTextField.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FZDefineKeyBoardTextField *tf = [[FZDefineKeyBoardTextField alloc]initWithFrame:CGRectMake(10, 100, 200, 50)];
    tf.backgroundColor = [UIColor greenColor];
    [self.view addSubview:tf];
        
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
