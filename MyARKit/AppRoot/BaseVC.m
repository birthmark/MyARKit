//
//  BaseVC.m
//  MyARKit
//
//  Created by alankong on 2017/11/13.
//  Copyright © 2017年 tuotiansudai. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)hideNavgationBar
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)showNavgationBar
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
