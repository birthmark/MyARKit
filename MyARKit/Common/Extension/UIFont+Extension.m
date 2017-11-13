//
//  UIFont+Extension.m
//  tuotianClient
//
//  Created by alankong on 15/7/21.
//  Copyright (c) 2015年 TuoTianSuDai. All rights reserved.
//

#import "UIFont+Extension.h"

#define IPAD_FONT_INCR 2.0

@implementation UIFont (Extension)

+ (UIFont *)appFontName:(NSString *)name size:(CGFloat)size
{
    //Georgia-Italic
    UIFont* font = [UIFont fontWithName:name size:size];
    if (font == nil) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)appLightFont:(CGFloat)size
{
    UIFont* font = [UIFont fontWithName:@"PingFangSC-Light" size:size];
    if (font == nil) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)appNormalFont:(CGFloat)size
{
    UIFont* font = [UIFont fontWithName:@"PingFangSC-Regular" size:size];
    if (font == nil) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
    
//    return [UIFont fontWithName:@"HelveticaNeue-Light" size:size];
//    return [UIFont fontWithName:@"STHeitiTC-Light" size:size];
//    return [UIFont systemFontOfSize:size];
}

+ (UIFont *)appBoldFont:(CGFloat)size
{
    UIFont* font = [UIFont fontWithName:@"PingFangSC-Medium" size:size];
    if (font == nil) {
        font = [UIFont boldSystemFontOfSize:size];
    }
    return font;
//    return [UIFont fontWithName:@"HelveticaNeue-Medium" size:size];
//    return [UIFont fontWithName:@"STHeitiTC-Medium" size:size];
//    return [UIFont boldSystemFontOfSize:size];
}

+ (UIFont *)appLanTingFont:(CGFloat)size//Lanting Regular
{
    UIFont* font = [UIFont fontWithName:@"FZLTDHK--GBK1-0" size:size];
    if (font == nil) {
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

+ (UIFont *)appLanTingBoldFont:(CGFloat)size//Lanting Medium
{
    UIFont* font = [UIFont fontWithName:@"FZLTDHK--GBK1-0" size:size];
    if (font == nil) {
        font = [UIFont boldSystemFontOfSize:size];
    }
    return font;
}

//FZLanTingHei-EB-GBK
@end
