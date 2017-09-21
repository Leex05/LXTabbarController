//
//  UIWindow+ViewControlle.h

//  LXTabbarController
//
//  Created by leex on 2017/9/21.
//  Copyright © 2017年 leex. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface UIWindow (ViewControlle)

- (UIViewController *)visibleViewController;
+ (UIViewController *)getVisibleViewControllerFrom:(UIViewController *)vc ;

@end
