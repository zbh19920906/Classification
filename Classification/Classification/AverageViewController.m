//
//  ClassViewController.m
//  Classification
//
//  Created by lk05 on 2018/9/4.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "AverageViewController.h"
#import "KKClassificationView.h"

@interface AverageViewController ()
@property (nonatomic, strong) NSArray *titleArr;
@property(strong, nonatomic) KKClassiflcationLayout *layout;
@property(strong, nonatomic) KKClassificationView *managerView;
@property(copy, nonatomic) NSMutableArray *viewControllers;
@end

@implementation AverageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.managerView];
}

#pragma mark - 懒加载
-(KKClassificationView *)managerView
{
    if (!_managerView) {
        _managerView = [[KKClassificationView alloc]initWithFrame:CGRectMake(0, NavHFit, self.view.bounds.size.width, HEIGHT_SCREEN - NavHFit) viewController:self layout:self.layout clickBlock:^(NSInteger index) {
            
        }];
    }
    return _managerView;
}

-(KKClassiflcationLayout *)layout
{
    if (!_layout) {
        _layout = [[KKClassiflcationLayout alloc] init];
        _layout.isAverage = YES;
        _layout.titleViewBgColor = [UIColor whiteColor];
        _layout.lrMargin = 10;
        //控制滑块高度
        _layout.sliderHeight = 38;
        _layout.titleMargin = 20;
        _layout.titleSelectColor = [UIColor cz_ToUIColorByStr:@"222222"];
        _layout.titleColor = [UIColor cz_ToUIColorByStr:@"959595"];
        _layout.titleFont = [UIFont systemFontOfSize:13];
        _layout.titles = self.titleArr;
        _layout.viewControllers = self.viewControllers;
        _layout.LinkColor = [UIColor cz_ToUIColorByStr:@"eeeeee"];
        _layout.linkHeight = 0.5;
        _layout.bottomLineHeight = 2;
        _layout.bottomLineWidth = 30;
        _layout.bottomLineColor = [UIColor redColor];
    }
    return _layout;
}

- (NSArray *)titleArr
{
    if (!_titleArr) {
        _titleArr = @[@"工艺",@"配饰",@"美妆",@"玩具",@"其他"];
    }
    return _titleArr;
}

- (NSMutableArray *)viewControllers
{
    if (!_viewControllers) {
        _viewControllers = [[NSMutableArray alloc]init];
        for (NSInteger i = 0 ; i < self.titleArr.count; i ++) {
            UIViewController *vc = [[UIViewController alloc]init];
            vc.view.backgroundColor = [UIColor cz_randomColor];
            [_viewControllers addObject:vc];
        }
    }
    return _viewControllers;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
