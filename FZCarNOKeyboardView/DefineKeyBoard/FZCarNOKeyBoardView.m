//
//  FZCarNOKeyBoardView.m
//  FZCarNOKeyboardView
//
//  Created by xiehewanbang on 2018/7/17.
//  Copyright © 2018年 xiehewanbang. All rights reserved.
//

#import "FZCarNOKeyBoardView.h"

#define  KEY_BOARD_WIDTH   [UIApplication sharedApplication].keyWindow.frame.size.width

@implementation FZCarNOKeyBoardView

- (instancetype)initUI
{
    self = [super initWithFrame:CGRectMake(0, 0,KEY_BOARD_WIDTH, 200)];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

+(instancetype)keyBoradView
{
    FZCarNOKeyBoardView *tempView = [[self alloc]initUI];
    return tempView;
    
}

@end
