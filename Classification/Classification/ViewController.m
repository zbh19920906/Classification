//
//  ViewController.m
//  Classification
//
//  Created by lk05 on 2018/9/4.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "ViewController.h"
#import "ClassViewController.h"
#import "AverageViewController.h"
#import "ScrollViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)click:(id)sender {
    UIButton *button = (UIButton *)sender;
    if (button.tag == 1) {
        ClassViewController *vc = [ClassViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (button.tag == 2) {
        AverageViewController *vc = [AverageViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        ScrollViewController *vc = [ScrollViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
