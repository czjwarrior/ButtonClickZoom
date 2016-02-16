//
//  ViewController.m
//  ButtonClickZoom
//
//  Created by cen on 16/2/16.
//  Copyright © 2016年 cen. All rights reserved.
//

#import "ViewController.h"
#define defaultScale 0.9
#define animateDelay 0.15   //默认动画执行时间

@interface ViewController ()
@property (nonatomic, strong) UIButton *scaleBtn;
@property (nonatomic, assign) CGFloat btnScale;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.scaleBtn];
}

- (UIButton *)scaleBtn{
    if (_scaleBtn == nil) {
        _scaleBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 40)];
        [_scaleBtn setBackgroundColor:[UIColor redColor]];
        [_scaleBtn addTarget:self action:@selector(pressedEvent) forControlEvents:UIControlEventTouchDown];
        [_scaleBtn addTarget:self action:@selector(unpressedEvent) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
    }
    return _scaleBtn;
}

- (void)pressedEvent{
    CGFloat scale = (_btnScale && _btnScale <= 1.0) ? _btnScale : defaultScale;
    [UIView animateWithDuration:animateDelay animations:^{
        _scaleBtn.transform = CGAffineTransformMakeScale(scale, scale);
    }];
}

- (void)unpressedEvent{
    [UIView animateWithDuration:animateDelay animations:^{
        _scaleBtn.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
        NSLog(@"按钮被点击了");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
