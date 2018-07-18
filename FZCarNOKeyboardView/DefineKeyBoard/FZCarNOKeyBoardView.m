//
//  FZCarNOKeyBoardView.m
//  FZCarNOKeyboardView
//
//  Created by xiehewanbang on 2018/7/17.
//  Copyright © 2018年 xiehewanbang. All rights reserved.
//

#import "FZCarNOKeyBoardView.h"
#import "FZTools.h"
#import "UIViewExt.h"
#import "YYModel.h"
#import "FZKeyBoardButtonModel.h"
/**
 @brief 屏幕适配的宏定义
 */
#define AUTOSIZEIPHONE6(i)                 (((([UIScreen mainScreen].bounds).size.width*2) / 750) * i) //根据屏幕宽度调整尺寸(以iPhone6尺寸为基准 750)

#define HEXTOCOLOR(hexValue) ([UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:1])


#define  KEY_BOARD_WIDTH   K_SCREEN_WIDTH
#define  KEY_BOARD_HEIGHT  AUTOSIZEIPHONE6(210)

#define MARGIN_LEFT         AUTOSIZEIPHONE6(4)
#define MARGIN_RIGHT        AUTOSIZEIPHONE6(4)
#define MARGIN_TOP          AUTOSIZEIPHONE6(7)
#define MARGIN_BOTTOM       AUTOSIZEIPHONE6(6)
#define BUTTSONS_DIS_H      AUTOSIZEIPHONE6(5)
#define BUTTSONS_DIS_V      AUTOSIZEIPHONE6(10)

#define MARGIN_LEFT_END         AUTOSIZEIPHONE6(16)


#define DELETE_BUTTON_KEY @"DEL"
#define MAKESURE_BUTTON_KEY @"确定"


#define BUTTON_ROWS                 4           //行数
#define BUTTON_ROW_NUMBER          10           //每行最多个数

#define BUTTON_HEIGHT   (((KEY_BOARD_HEIGHT - MARGIN_TOP- MARGIN_BOTTOM)-(BUTTON_ROWS-1)*BUTTSONS_DIS_V)/BUTTON_ROWS)
#define BUTTON_WIDTH  (((KEY_BOARD_WIDTH -MARGIN_LEFT- MARGIN_RIGHT) - (BUTTON_ROW_NUMBER-1) * BUTTSONS_DIS_H)/BUTTON_ROW_NUMBER)



@interface FZCarNOKeyBoardView ()

@property (nonatomic,strong) NSMutableArray *mUIDateArray;


@property (nonatomic,strong) NSArray *mModelDateArray;


@end



@implementation FZCarNOKeyBoardView

- (instancetype)initUI
{
    self = [super initWithFrame:CGRectMake(0, 0,KEY_BOARD_WIDTH, KEY_BOARD_HEIGHT)];
    if (self) {
        self.backgroundColor = HEXTOCOLOR(0xcccccc);
        [self getButtonsModel];
        [self createButtons];
    }
    return self;
}

+(instancetype)keyBoradView
{
    FZCarNOKeyBoardView *tempView = [[self alloc]initUI];
    return tempView;
}

-(NSMutableArray *)mUIDateArray
{
    if(!_mUIDateArray){
        _mUIDateArray = [NSMutableArray new];
    }
    return _mUIDateArray;
}

-(void)getButtonsModel
{
    [self.mUIDateArray addObjectsFromArray:[self getNumberButtonsDict]];
    [self.mUIDateArray addObjectsFromArray:[self getLetterButtonQToM]];
    
    self.mModelDateArray = [NSArray yy_modelArrayWithClass:[FZKeyBoardButtonModel class] json:self.mUIDateArray];
}

/**
 @brief 获得数字
 */
-(NSArray *)getNumberButtonsDict
{
    NSArray *tempArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
    CGFloat buttonWidth = BUTTON_WIDTH;
    CGFloat buttonHeight = BUTTON_HEIGHT;
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];
    for (NSString *title in tempArray) {
        NSDictionary *tempDict =@{
          @"title":title,
          @"titleColor":@"333333",
          @"backColor":@"ffffff",
          @"buttonWidth":[NSNumber numberWithFloat:buttonWidth],
          @"buttonHeight":[NSNumber numberWithFloat:buttonHeight],
          };
        [resultArray addObject:tempDict];
    }
    return  resultArray;
}

-(NSArray *)getLetterButtonQToM//包含删除
{
    NSArray *tempArray = @[@"Q",@"W",@"E",@"R",@"T",@"Y",@"U",@"I",@"O",@"P"
                           ,@"A",@"S",@"D",@"F",@"G",@"H",@"J",@"K",@"L",DELETE_BUTTON_KEY
                           ,@"Z",@"X",@"C",@"V",@"B",@"N",@"M",MAKESURE_BUTTON_KEY
                           ];
    CGFloat buttonWidth = BUTTON_WIDTH;
    CGFloat buttonHeight = BUTTON_HEIGHT;
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];
    for (NSString *title in tempArray) {
        NSMutableDictionary *tempDict =[[NSMutableDictionary alloc]initWithDictionary:@{
                                                                                        @"title":title,
                                                                                        @"titleColor":@"333333",
                                                                                        @"backColor":@"ffffff",
                                                                                        @"buttonWidth":[NSNumber numberWithFloat:buttonWidth],
                                                                                        @"buttonHeight":[NSNumber numberWithFloat:buttonHeight],
                                                                                        }];
        //删除按钮
        if([title isEqualToString:DELETE_BUTTON_KEY]){
            [tempDict setObject:@"imageName.png" forKey:@"imageName"];
        }
        //确定按钮
        if([title isEqualToString:MAKESURE_BUTTON_KEY]){
            [tempDict setObject:@"ffffff" forKey:@"titleColor"];
            [tempDict setObject:@"3366ff" forKey:@"backColor"];
            [tempDict setObject:[NSNumber numberWithFloat:AUTOSIZEIPHONE6(82)] forKey:@"buttonWidth"];

        }
        [resultArray addObject:tempDict];
    }
    return  resultArray;
}

#pragma mark--------------------------------关于按钮的创建--------------------------
-(void)createButtons
{
    
    NSLog(@"%.2f",KEY_BOARD_WIDTH);

    NSLog(@"%.2f",BUTTON_WIDTH);
    int i = 0;
    for (FZKeyBoardButtonModel *model in self.mModelDateArray) {
        UIButton *mButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, model.buttonWidth, model.buttonHeight)];
        
        mButton.top = MARGIN_TOP + (BUTTON_HEIGHT + BUTTSONS_DIS_V)*(i/BUTTON_ROW_NUMBER);
        if(i<30){
            mButton.left = MARGIN_LEFT+(BUTTON_WIDTH + BUTTSONS_DIS_H )*(i%BUTTON_ROW_NUMBER);
        }else{
            mButton.left = MARGIN_LEFT_END+(BUTTON_WIDTH + BUTTSONS_DIS_H )*(i%BUTTON_ROW_NUMBER);
        }
        if(model.imageName.length){
            [mButton setImage:[UIImage imageNamed:model.imageName] forState:UIControlStateNormal];
        }else{
            [mButton setTitle:model.title forState:UIControlStateNormal];
        }
        
        mButton.backgroundColor = HEXCOLORSTRING(model.backColor);
        [mButton setTitleColor:HEXCOLORSTRING(model.titleColor) forState:UIControlStateNormal];
        mButton.layer.cornerRadius = AUTOSIZEIPHONE6(5);
        [self addSubview:mButton];
        i++;
    }
    
}


@end
