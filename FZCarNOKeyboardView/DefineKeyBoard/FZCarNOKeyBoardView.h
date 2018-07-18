//
//  FZCarNOKeyBoardView.h
//  FZCarNOKeyboardView
//
//  Created by xiehewanbang on 2018/7/17.
//  Copyright © 2018年 xiehewanbang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DELETE_BUTTON_KEY @"DEL"
#define MAKESURE_BUTTON_KEY @"确定"

@class FZKeyBoardButtonModel;

@interface FZCarNOKeyBoardView : UIView





@property (nonatomic,strong) void (^buttonClick) (FZKeyBoardButtonModel*model);

+(instancetype)keyBoradView;


@end
