//
//  FZDefineKeyBoardTextField.m
//  FZCarNOKeyboardView
//
//  Created by xiehewanbang on 2018/7/17.
//  Copyright © 2018年 xiehewanbang. All rights reserved.
//

#import "FZDefineKeyBoardTextField.h"
#import "FZCarNOKeyBoardView.h"
#import "FZKeyBoardButtonModel.h"

@implementation FZDefineKeyBoardTextField


-(void)awakeFromNib
{
    [super awakeFromNib];
    [self initKeyBorad];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initKeyBorad];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initKeyBorad];
    }
    return self;
}


/**
 @brief 初始化键盘
 */
-(void)initKeyBorad
{
    FZCarNOKeyBoardView *temp = [FZDefineKeyBoardTextField getKeyBoradView];
    temp.buttonClick = ^(FZKeyBoardButtonModel *model) {
        [self changeTextWithModel:model];
    };
    self.inputView =temp;
    
}

+(FZCarNOKeyBoardView *)getKeyBoradView
{
    FZCarNOKeyBoardView *temp =[FZCarNOKeyBoardView keyBoradView];
    return temp;
}

-(void)changeTextWithModel:(FZKeyBoardButtonModel *)model
{
    if([model.title isEqualToString:DELETE_BUTTON_KEY]){
        if(self.text.length>0){
            self.text = [self.text substringWithRange:NSMakeRange(0, self.text.length-1)];
        }
    }else if([model.title isEqualToString:MAKESURE_BUTTON_KEY]){
        [self resignFirstResponder];
    }else{
        self.text = [self.text stringByAppendingString:model.title];
    }
}

@end
