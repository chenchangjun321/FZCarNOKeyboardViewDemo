//
//  FZDefineKeyBoardTextField.m
//  FZCarNOKeyboardView
//
//  Created by xiehewanbang on 2018/7/17.
//  Copyright © 2018年 xiehewanbang. All rights reserved.
//

#import "FZDefineKeyBoardTextField.h"
#import "FZCarNOKeyBoardView.h"

@implementation FZDefineKeyBoardTextField



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.inputView = [FZDefineKeyBoardTextField getKeyBoradView];
    }
    return self;
}

+(UIView *)getKeyBoradView
{
    return [FZCarNOKeyBoardView keyBoradView];
}

@end
