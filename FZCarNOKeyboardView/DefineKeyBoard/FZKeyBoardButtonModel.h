//
//  FZKeyBoardButtonModel.h
//  FZCarNOKeyboardView
//
//  Created by 陈长军 on 2018/7/18.
//  Copyright © 2018年 xiehewanbang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FZKeyBoardButtonModel : NSObject

/**
  *@brief 按钮标题
*/
@property (nonatomic, copy) NSString *title;

/**
 *@brief 标题颜色
 */
@property (nonatomic, copy) NSString *titleColor;

/**
 *@brief 按钮背景颜色
 */
@property (nonatomic, copy) NSString *backColor;

/**
 *@brief 按钮图片名称
 */
@property (nonatomic, copy) NSString *imageName;

/**
 *@brief 按钮宽度
 */
@property (nonatomic, assign) float buttonWidth;


/**
 *@brief 按钮宽度
 */
@property (nonatomic, assign) float buttonHeight;

@end
