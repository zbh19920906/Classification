//
//  KKSliderButtonView.h
//  CloudMoto
//
//  Created by lk05 on 2018/8/11.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKClassiflcationLayout.h"
@interface KKSliderButtonView : UIView
@property (nonatomic, weak) id delegate;
- (instancetype)initWithFrame:(CGRect)frame layout:(KKClassiflcationLayout *)layout;
- (void)changeBtnSeleted:(NSInteger)index;
@end
@protocol KKSliderButtonViewDelegate <NSObject>
- (void)changeSubView:(NSInteger)index;
@end
