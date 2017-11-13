//
//  CommonDef.h
//  MyARKit
//
//  Created by alankong on 2017/11/13.
//  Copyright © 2017年 tuotiansudai. All rights reserved.
//

#ifndef CommonDef_h
#define CommonDef_h


#define weakify( x ) \
__weak typeof(x) __weak_##x##__ = x;

#define strongify( x ) \
typeof(x) x = __weak_##x##__;

#endif /* CommonDef_h */
