//
//  KKSliderButtonView.m
//  CloudMoto
//
//  Created by lk05 on 2018/8/11.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "KKSliderButtonView.h"

@interface KKSliderButtonView ()
@property (nonatomic, strong) KKClassiflcationLayout *layout;
@property (nonatomic, strong) UIView *linkView;
@property (nonatomic, strong) UIButton *oldButton;
@property (nonatomic, strong) UIScrollView *scrollView;
@end
@implementation KKSliderButtonView

- (instancetype)initWithFrame:(CGRect)frame layout:(KKClassiflcationLayout *)layout
{
    if (self = [super initWithFrame:frame]) {
        self.layout = layout;
        self.backgroundColor = self.layout.titleViewBgColor;
        [self setSubView];
    }
    return self;
}

- (void)setSubView
{
    UIButton *leftBtn;
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, self.layout.sliderHeight)];
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.scrollView];
    
    for (NSInteger i = 0;i <self.layout.titles.count ; i ++) {
        NSString *title = self.layout.titles[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:self.layout.titleColor forState:UIControlStateNormal];
        btn.titleLabel.font = self.layout.titleFont;
        btn.showsTouchWhenHighlighted = NO;
        btn.adjustsImageWhenHighlighted = NO;
        btn.tag = i + 100;
        if (!self.layout.isAverage) {
            CGSize size = [title boundingRectWithSize:CGSizeMake(WIDTH_SCREEN, self.layout.sliderHeight) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: self.layout.titleFont} context:nil].size;
            CGFloat margin = i == 0 ? self.layout.lrMargin : self.layout.titleMargin;
            btn.frame = CGRectMake(leftBtn.frame.origin.x + leftBtn.frame.size.width + margin, 0, size.width, self.layout.sliderHeight);
        }else{
            CGFloat width = (WIDTH_SCREEN - self.layout.lrMargin * 2) / self.layout.titles.count;
            btn.frame = CGRectMake(width * i + self.layout.lrMargin, 0, width, self.layout.sliderHeight);
        }
        [self.scrollView addSubview:btn];
        leftBtn = btn;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            btn.selected = YES;
             [btn setTitleColor:self.layout.titleSelectColor forState:UIControlStateNormal];
            _oldButton = btn;
            self.linkView = [[UIView alloc]init];
            self.linkView.backgroundColor = self.layout.bottomLineColor;
            self.linkView.hidden = self.layout.isHidenBottomLine;
            self.linkView.frame = CGRectMake(btn.center.x - self.layout.bottomLineWidth / 2, self.layout.sliderHeight - self.layout.bottomLineHeight - 3, self.layout.bottomLineWidth, self.layout.bottomLineHeight);
            [self.scrollView addSubview:self.linkView];
        }
    }
    
    UIView *linkView = [[UIView alloc]initWithFrame:CGRectMake(0, self.layout.sliderHeight - self.layout.linkHeight, self.frame.size.width, self.layout.linkHeight)];
    linkView.backgroundColor = self.layout.LinkColor;
    [self.scrollView addSubview:linkView];
    
    self.scrollView.contentSize = CGSizeMake(leftBtn.frame.origin.x + leftBtn.frame.size.width + self.layout.lrMargin, 1);
}

- (void)btnClick:(UIButton *)button
{

    if (button.tag == _oldButton.tag) {
        return;
    }
     [button setTitleColor:self.layout.titleSelectColor forState:UIControlStateNormal];
    [_oldButton setTitleColor:self.layout.titleColor forState:UIControlStateNormal];
    
    _oldButton = button;
    [UIView animateWithDuration:.5 animations:^{
        self.linkView.frame = CGRectMake(button.center.x - self.layout.bottomLineWidth / 2, self.layout.sliderHeight - self.layout.bottomLineHeight - 3, self.layout.bottomLineWidth, self.layout.bottomLineHeight);
        if (_delegate && [_delegate respondsToSelector:@selector(changeSubView:)]) {
            [_delegate changeSubView:button.tag - 100];
        }
    }];
}

- (void)changeBtnSeleted:(NSInteger)index
{
    [self btnClick:(UIButton *)[self viewWithTag:index + 100]];
}
@end
