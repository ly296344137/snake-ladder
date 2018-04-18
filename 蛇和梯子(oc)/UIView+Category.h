//
//  UIView+Category.h
//  钱包
//
//  Created by Yoyo on 15/8/12.
//  Copyright (c) 2015年 clearning. All rights reserved.
//

#import <UIKit/UIKit.h>

#define URLError @"请检查网络" //网络不正确

#define WeightRate ViewWeight/375
#define HeightRate ViewHeight/667

#define CellHeight 90*ImgHeightRate
#define HeaderHeight 20*ImgHeightRate
#define FooterHeight 5*ImgHeightRate
#define Blank 30*ImgHeightRate
#define TableLeft 52*ImgWidthRate
#define TableWidth ViewWeight-104*ImgWidthRate
#define CheckImageWH 35*ImgWidthRate

#define CellRightImage CellHeight*2-1
#define BlackHeight CellHeight+FooterHeight

#define TableViewHeaderFontSize 13*ImgHeightRate
#define TableViewCellFontSize 12*ImgHeightRate

#define ButtonWeight 650*ImgWidthRate
#define ButtonHeight 86*ImgHeightRate

#define AwardWidth 580*ImgWidthRate

#define TextFieldX 160*ImgWidthRate//输入框开始位置

#define LittelFont [UIFont systemFontOfSize:25*ImgWidthRate]
//[UIFont fontWithName:@"Helvetica"  size:14*HeightRate]
#define MiddleFont [UIFont systemFontOfSize:28*ImgWidthRate]
#define MainTitleFont [UIFont systemFontOfSize:30*ImgWidthRate]
#define BoldMiddleFont [UIFont fontWithName:@"Helvetica-Bold" size:28*ImgWidthRate]
//[UIFont fontWithName:@"Helvetica"  size:16*HeightRate]
#define LargeFont [UIFont systemFontOfSize:33*ImgWidthRate]
#define BoldLargeFont [UIFont fontWithName:@"Helvetica-Bold" size:33*ImgWidthRate]
#define BiggestFont [UIFont systemFontOfSize:36*ImgWidthRate]
#define BarTitleFont [UIFont systemFontOfSize:40*ImgWidthRate]
#define AmountFount [UIFont systemFontOfSize:60*ImgWidthRate]

#define ViewWeight self.view.viewWidth
#define ViewHeight self.view.viewHeight

#define Iphone6Weight 375
#define Iphone6Height 667

#define ImgHeightRate ViewHeight/1334
#define ImgWidthRate ViewWeight/750




#define NavigationHeight self.navigationController.navigationBar.viewHeight+20

#define ButtonFont [UIFont fontWithName:@"Helvetica"  size:TableViewCellFontSize]
#define BlodFont [UIFont fontWithName:@"Helvetica-Bold" size:TableViewCellFontSize]

#define TabBarColor [UIColor colorWithRed:52.0/255.0 green:51.0/255.0 blue:57.0/255.0 alpha:1]
#define BackgroundColor [UIColor colorWithRed:249.0/255.0 green:249.0/255.0 blue:249.0/255.0 alpha:1]
#define BlackTextColor [UIColor colorWithRed:50.0/255.0 green:50.0/255.0 blue:50.0/255.0 alpha:1]
#define UnButtonColor [UIColor colorWithRed:226.0/255.0 green:97.0/255.0 blue:98.0/255.0 alpha:1]
#define ButtonColor [UIColor colorWithRed:0 green:160.0/255.0 blue:241.0/255.0 alpha:1]
#define TableBoardColor [UIColor colorWithRed:226.0/255.0 green:226.0/255.0 blue:226.0/255.0 alpha:1]//tableView边框
#define OragneColor [UIColor colorWithRed:255.0/255.0 green:151.0/255.0 blue:49.0/255.0 alpha:1]//验证码背景
#define SegmentButtonColor [UIColor colorWithRed:250.0/255.0 green:86.0/255.0 blue:54.0/255.0 alpha:1]
#define AwardTextColor [UIColor colorWithRed:208.0/255.0 green:208.0/255.0 blue:208.0/255.0 alpha:1]//提示信息灰色
#define BlueColor [UIColor colorWithRed:255.0/255.0 green:151.0/255.0 blue:49.0/255.0 alpha:1]
#define CaiFuLight [UIColor colorWithRed:29.0/255.0 green:179.0/255.0 blue:255.0/255.0 alpha:1]//财富页面充值、提现按钮背景
#define PointLabelColor [UIColor colorWithRed:255.0/255.0 green:151.0/255.0 blue:49.0/255.0 alpha:1]//收银台、卡头、提现费率重要文字
#define BackColor [UIColor colorWithRed:50.0/255.0 green:50.0/255.0 blue:50.0/255.0 alpha:1]//返回按钮的颜色
#define PositionBackColor [UIColor colorWithRed:0 green:172.0/255.0 blue:232.0/255.0 alpha:1]//头衔背景颜色
#define ErrorAwardColor [UIColor colorWithRed:241.0/255.0 green:84.0/255.0 blue:83.0/255.0 alpha:1]//错误提示，红色

#define InvalidToken @"29"//token过期
#define NoData @"100"

#define DeletePostImg @"DeletePostImg" //删除新建帖子图片
#define GetNolmCardInfo @"getNolmCardInfo" //获取到已添加的银行卡信息
#define SelectedBackCard @"SelectedBackCard" //选中卡
#define T0 @"10041"//T0提现
#define WeiChat @"weiChatNotification"//微信通知
#define TieZiDetail @"TieZiDetail" //帖子详情通知是否收藏和点赞
#define ActivityDetail @"ActivityDetail" //帖子详情通知是否收藏和点赞
#define SelectProvince @"SelectProvince" //选择省份
#define SelectCity @"SelectCity" //选择城市
#define ShowBigImage @"ShowBigImage"//打开大图

#define EndPoint @"http://oss-cn-hangzhou.aliyuncs.com/"
#define MultipartUploadKey @"multipartUploadObject"

#define SelectedBranch @"SelectedBranch"//选中银行分支

@interface UIView (Category)

@property (nonatomic, assign) CGFloat viewHeight;
@property (nonatomic, assign) CGFloat viewWidth;
@property (nonatomic, assign) CGFloat viewX;
@property (nonatomic, assign) CGFloat viewY;







#pragma mark EasyIssuingCard
/** 首页主流红色 */

#define Mf05452 [UIColor colorWithRed:240/255.0 green:84/255.0  blue:82/255.0  alpha:1]
#define graytitleColor [UIColor colorWithRed:169/255.0 green:169/255.0  blue:169/255.0  alpha:1]

#define M8f8f8f [UIColor colorWithRed:143/255.0 green:143/255.0  blue:143/255.0  alpha:1]

//比例缩放
#define Mengwidth(width) ImgWidthRate*width
#define Mengheight(height) ImgHeightRate*height
#define ScreenWidth    [UIScreen mainScreen].bounds.size.width
#define ScreenHeight   [UIScreen mainScreen].bounds.size.height


@end
