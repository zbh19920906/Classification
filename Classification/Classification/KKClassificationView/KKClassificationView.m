//
//  KKClassificationView.m
//  CloudMoto
//
//  Created by lk05 on 2018/8/10.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "KKClassificationView.h"
#import "KKSliderButtonView.h"
@interface KKClassificationView ()<UICollectionViewDelegate, UICollectionViewDataSource,KKSliderButtonViewDelegate>
@property (nonatomic, strong) KKClassiflcationLayout *layout;

@property (nonatomic, strong) UICollectionView *collection;
@property (nonatomic, strong) KKSliderButtonView *sliderView;
@property (nonatomic, strong) UIViewController *viewController;
@end
@implementation KKClassificationView

- (instancetype)initWithFrame:(CGRect)frame viewController:(UIViewController *)viewController layout:(KKClassiflcationLayout *)layout clickBlock:(ClickBlock)block
{
    if (self = [super initWithFrame:frame]) {
        self.layout = layout;
        self.clickBlock = block;
        
        self.viewController = viewController;
        for (UIViewController *vc in self.layout.viewControllers) {
            [self.viewController addChildViewController:vc];
        }
        [self setSubView];
    }
    return self;
}

- (void)setSubView
{
    
    [self addSubview:self.collection];
    
    _sliderView = [[KKSliderButtonView alloc]initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, self.layout.sliderHeight) layout:self.layout];
    _sliderView.delegate = self;
    [self addSubview:_sliderView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.layout.viewControllers.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIViewController *subVC = self.layout.viewControllers[indexPath.row];
    subVC.view.frame = CGRectMake(0, 0, WIDTH_SCREEN, self.frame.size.height - self.layout.sliderHeight);
    [cell.contentView addSubview:subVC.view];
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / WIDTH_SCREEN;
    [_sliderView changeBtnSeleted:index];
    self.clickBlock(index);
}

- (void)changeSubView:(NSInteger)index
{
    self.clickBlock(index);
    [self.collection scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

- (void)scrollToIndexWithIndex:(NSInteger)index
{
    [_sliderView changeBtnSeleted:index];
    [self.collection scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

- (UICollectionView *)collection
{
    if (!_collection) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(WIDTH_SCREEN, self.frame.size.height - self.layout.sliderHeight);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsZero;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.layout.sliderHeight, WIDTH_SCREEN, self.frame.size.height - self.layout.sliderHeight) collectionViewLayout:layout];
        _collection.delegate = self;
        _collection.dataSource = self;
        _collection.showsHorizontalScrollIndicator = NO;
        _collection.backgroundColor = [UIColor whiteColor];
        _collection.pagingEnabled = YES;
        [_collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _collection;
}

@end
