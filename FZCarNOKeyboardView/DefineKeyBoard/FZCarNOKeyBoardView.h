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
/**
 删除按钮的图片名称
 */
#define DEL_IMAGE_NAME @"shanchu_keyboard"

@class FZKeyBoardButtonModel;

@interface FZCarNOKeyBoardView : UIView

/**
 按钮的点击事件
 */
@property (nonatomic,strong) void (^buttonClick) (FZKeyBoardButtonModel*model);

/**
初始化方法
 */
+(instancetype)keyBoradView;


@end
