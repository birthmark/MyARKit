//
//  UIFont+Extension.h
//  tuotianClient
//
//  Created by alankong on 15/7/21.
//  Copyright (c) 2015年 TuoTianSuDai. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIFont (Extension)

+ (UIFont *)appFontName:(NSString*)name size:(CGFloat)size;
+ (UIFont *)appLightFont:(CGFloat)size;
+ (UIFont *)appNormalFont:(CGFloat)size;
+ (UIFont *)appBoldFont:(CGFloat)size;
+ (UIFont *)appLanTingFont:(CGFloat)size;//Lanting Regular
+ (UIFont *)appLanTingBoldFont:(CGFloat)size;//Lanting Medium

@end
