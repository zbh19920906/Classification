//
//  KKClassiflcationLayout.h
//  CloudMoto
//
//  Created by lk05 on 2018/8/11.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface KKClassiflcationLayout : NSObject
/**
 背景颜色
 */
@property (nonatomic, copy) UIColor *titleViewBgColor;
/**
 标题颜色
 */
@property (nonatomic, copy) UIColor *titleColor;
/**
 标题选中颜色
 */
@property (nonatomic, copy) UIColor *titleSelectColor;
/**
 标题字号
 */
@property (nonatomic, copy) UIFont *titleFont;
/**
 距离最左边和最右边的距离
 */
@property (nonatomic, assign) CGFloat lrMargin;
/**
 标题直接的间隔（标题距离下一个标题的间隔）
 */
@property (nonatomic, assign) CGFloat titleMargin;
/**
 YES平均分配  NO从最左开始
 */
@property (nonatomic, assign) BOOL isAverage;
/**
 整个滑块的高
 */
@property (nonatomic, assign) CGFloat sliderHeight;
/**
 选中标题位置的线高
 */
@property (nonatomic, assign) CGFloat bottomLineHeight;
/**
 选中标题位置的线宽
 */
@property (nonatomic, assign) CGFloat bottomLineWidth;
/**
 选中标题位置的线颜色
 */
@property (nonatomic, copy) UIColor *bottomLineColor;
/**
 是否显示选中标题位置的线
 */
@property (nonatomic, assign) BOOL isHidenBottomLine;

/**
 分割线颜色
 */
@property (nonatomic, copy) UIColor *LinkColor;
/**
 分割线的高
 */
@property (nonatomic, assign) CGFloat linkHeight;

/**
 标题数组
 */
@property (nonatomic, copy) NSArray *titles;

/**
 容器数组
 */
@property (nonatomic, copy) NSArray *viewControllers;

@end
