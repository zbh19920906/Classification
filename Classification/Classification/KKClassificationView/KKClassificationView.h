//
//  KKClassificationView.h
//  CloudMoto
//
//  Created by lk05 on 2018/8/10.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKClassiflcationLayout.h"
typedef void (^ClickBlock)(NSInteger index);
@interface KKClassificationView : UIView
@property (nonatomic, copy) ClickBlock clickBlock;
/**
 初始化方法

 @param frame frame
 @param viewController 主控制器
 @param layout KKClassiflcationLayout
 @param block 回调
 @return
 */
- (instancetype)initWithFrame:(CGRect)frame viewController:(UIViewController *)viewController layout:(KKClassiflcationLayout *)layout clickBlock:(ClickBlock)block;
- (void)scrollToIndexWithIndex:(NSInteger)index;
@end
