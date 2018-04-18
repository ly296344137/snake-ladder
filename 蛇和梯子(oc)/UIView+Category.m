//
//  UIView+Category.m
//  钱包
//
//  Created by Yoyo on 15/8/12.
//  Copyright (c) 2015年 clearning. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)
- (CGFloat)viewHeight
{
    return self.frame.size.height;
}

- (void)setViewHeight:(CGFloat)viewHeight
{
    CGRect temp = self.frame;
    temp.size.height = viewHeight;
    self.frame = temp;
}

- (CGFloat)viewWidth
{
    return self.frame.size.width;
}

- (void)setViewWidth:(CGFloat)viewWidth
{
    CGRect temp = self.frame;
    temp.size.width = viewWidth;
    self.frame = temp;
}

- (CGFloat)viewX
{
    return self.frame.origin.x;
}

- (void)setViewX:(CGFloat)viewX
{
    CGRect temp = self.frame;
    temp.origin.x = viewX;
    self.frame = temp;
}

- (CGFloat)viewY
{
    return self.frame.origin.y;
}

- (void)setViewY:(CGFloat)viewY
{
    CGRect temp = self.frame;
    temp.origin.y = viewY;
    self.frame = temp;
}

@end
