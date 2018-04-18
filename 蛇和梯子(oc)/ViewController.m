//
//  ViewController.m
//  蛇和梯子(oc)
//
//  Created by Yoyo on 2018/4/16.
//  Copyright © 2018年 clearning. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Category.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSDictionary *geziDic;
    int countIndex;
    int currentIndex;
    UIImageView *peopleV;
    UIButton *diceV;
    UILabel *countLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    float wh = 700*ImgWidthRate;
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake((ViewWeight-wh)/2, CellHeight*2, wh, wh)];
    imgV.image = [UIImage imageNamed:@"beijing"];
    [self.view addSubview:imgV];
    
    UIView *v = [[UIView alloc] initWithFrame:imgV.frame];
    [self.view addSubview:v];
    
    int index = 0;
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    for (int i=0; i<5; i++) {
        NSNumber *y = [NSNumber numberWithFloat:(4-i)*wh/5];
        NSNumber *x;
        if (i % 2 != 0) {
            for (int j=5; j>0; j--) {
                index ++;
                x = [NSNumber numberWithFloat:(j-1)*wh/5];
                [dic setObject:@[x, y] forKey:[NSString stringWithFormat:@"%d", index]];
            }
        } else {
            for (int j=0; j<5; j++) {
                index ++;
                x = [NSNumber numberWithFloat:j*wh/5];
                [dic setObject:@[x, y] forKey:[NSString stringWithFormat:@"%d", index]];
            }
        }
    }
    geziDic = [NSDictionary dictionaryWithDictionary:dic];
    
    NSArray *ary = [geziDic objectForKey:@"1"];
    peopleV = [[UIImageView alloc] initWithFrame:CGRectMake([ary[0] floatValue], [ary[1] floatValue], wh/5, wh/5)];
    peopleV.image = [UIImage imageNamed:@"people"];
    [v addSubview:peopleV];
    
    float shaizi = 200*ImgWidthRate;
    diceV = [[UIButton alloc] initWithFrame:CGRectMake((ViewWeight-shaizi)/2, CellHeight*5+wh, shaizi, shaizi)];
    [diceV setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    diceV.adjustsImageWhenDisabled = NO;
    [diceV addTarget:self action:@selector(shakeDice) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:diceV];
    
    countLabel = [[UILabel alloc] initWithFrame:CGRectMake(CellHeight, CellHeight*3+wh, ViewWeight-CellHeight*2, CellHeight)];
    countLabel.textColor = [UIColor blueColor];
    countLabel.layer.cornerRadius = 10;
    countLabel.layer.borderColor = [UIColor blueColor].CGColor;
    countLabel.textAlignment = 1;
    countLabel.layer.borderWidth = 1;
    countLabel.text = @"您已走了0步";
    [self.view addSubview:countLabel];
    
    countIndex = 0;
    currentIndex = 1;
}

- (void)shakeDice
{
    if (diceV.enabled) {
        diceV.enabled = NO;
        NSArray *ary = @[[UIImage imageNamed:@"1"], [UIImage imageNamed:@"2"], [UIImage imageNamed:@"3"], [UIImage imageNamed:@"4"], [UIImage imageNamed:@"5"], [UIImage imageNamed:@"6"]];
        __block int count = 0;
        [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:YES block:^(NSTimer * _Nonnull timer) {
            int r = arc4random() % 5;
            [UIView animateWithDuration:0.2 animations:^{
                [self->diceV setBackgroundImage:ary[r] forState:UIControlStateNormal];
            } completion:^(BOOL finished) {
                count ++;
                if (count > 10) {
                    [timer invalidate];
                    [self peopleGo:r+1];
                }
            }];
        }];
    }
}

- (void)peopleGo:(int)count
{
    float t = [self pathAnimaitonLine:count];
    [NSTimer scheduledTimerWithTimeInterval:t repeats:NO block:^(NSTimer * _Nonnull timer) {
        [self check];
    }];
}

- (void)check{
    BOOL change = YES;
    int end = 0;
    switch (currentIndex) {
        case 3:
            end = 11;
            break;
        case 10:
            end = 12;
            break;
        case 9:
            end = 18;
            break;
        case 6:
            end = 17;
            break;
        case 24:
            end = 16;
            break;
        case 14:
            end = 4;
            break;
        case 19:
            end = 8;
            break;
        case 22:
            end = 20;
            break;
            
        default:
            change = NO;
            break;
    }
    if (change) {
        [self pathAnimationLadder:currentIndex withEnd:end];
    }
    if (currentIndex == 25) {
        countIndex ++;
        [self pathAnimaitonLine:24];
        countLabel.text = [NSString stringWithFormat:@"成功,您走了%d步", countIndex];
        countIndex = 0;
    } else {
        countIndex ++;
        countLabel.text = [NSString stringWithFormat:@"您已走了%d步", countIndex];
    }
    diceV.enabled = YES;
}

- (void)pathAnimationLadder:(int)start withEnd:(int)end
{
    NSArray *s = [geziDic objectForKey:[NSString stringWithFormat:@"%d", start]];
    NSArray *e = [geziDic objectForKey:[NSString stringWithFormat:@"%d", end]];
    NSArray *ary = @[
                    [NSValue valueWithCGPoint:CGPointMake([s[0] floatValue], [s[1] floatValue])],
                    [NSValue valueWithCGPoint:CGPointMake([e[0] floatValue], [e[1] floatValue])]
                    ];
    CAKeyframeAnimation *runAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    runAnimation.values = [NSArray arrayWithArray:ary];
    runAnimation.fillMode = kCAFillModeForwards;
    runAnimation.removedOnCompletion = NO;// 是否在动画完成后从 Layer 层上移除  回到最开始状态
    runAnimation.duration = 1.0f;
    runAnimation.repeatCount = 0;
    peopleV.layer.anchorPoint = CGPointMake(0, 0);
    [peopleV.layer addAnimation:runAnimation forKey:nil];
    currentIndex = end;
}

- (float)pathAnimaitonLine:(int)count
{
    NSMutableArray *ary = [NSMutableArray array];
    int n = currentIndex;
    if (count + currentIndex < 26) {
        while (n <= currentIndex+count) {
            NSArray *a = [geziDic objectForKey:[NSString stringWithFormat:@"%d", n]];
            CGPoint p = CGPointMake([a[0] floatValue], [a[1] floatValue]);
            [ary addObject:[NSValue valueWithCGPoint:p]];
            n ++;
        }
        currentIndex += count;
    } else {
        while (n <= 25) {
            NSArray *a = [geziDic objectForKey:[NSString stringWithFormat:@"%d", n]];
            CGPoint p = CGPointMake([a[0] floatValue], [a[1] floatValue]);
            [ary addObject:[NSValue valueWithCGPoint:p]];
            n ++;
        }
        n = 25;
        while (n >= 50-(count+currentIndex)) {
            NSArray *a = [geziDic objectForKey:[NSString stringWithFormat:@"%d", n]];
            CGPoint p = CGPointMake([a[0] floatValue], [a[1] floatValue]);
            [ary addObject:[NSValue valueWithCGPoint:p]];
            n --;
        }
        currentIndex = 50-(count+currentIndex);
    }
    CAKeyframeAnimation *runAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    runAnimation.values = [NSArray arrayWithArray:ary];
    runAnimation.fillMode = kCAFillModeForwards;
    runAnimation.removedOnCompletion = NO;// 是否在动画完成后从 Layer 层上移除  回到最开始状态
    runAnimation.duration = [ary count]*0.5f;
    runAnimation.repeatCount = 0;
    peopleV.layer.anchorPoint = CGPointMake(0, 0);
    [peopleV.layer addAnimation:runAnimation forKey:nil];
    return [ary count]*0.5f;
}

@end
