//
//  LXNavgationController.m
//  LXTabbarController
//
//  Created by leex on 2017/9/21.
//  Copyright © 2017年 leex. All rights reserved.
//

#import "LXNavgationController.h"

@interface LXNavgationController ()

@end

@implementation LXNavgationController

+ (UIImage*)createImageWithColor:(UIColor*)color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIImage*)createImageWithColorString:(NSString *)colorString {
    UIColor *color = [self hexStringToColor:colorString];
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+(UIColor *) hexStringToColor: (NSString *) stringToConvert
{
    return [self hexStringToColor:stringToConvert andAlpha:1.0];
}

+(UIColor *) hexStringToColor: (NSString *) stringToConvert andAlpha:(CGFloat)alpha
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor clearColor];
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    
    if (alpha >1.0 || alpha < 0) {
        alpha = 1.0;
    }
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}


+ (void)initialize {
    //设置UIBarButtonItem的主题
    //    [self setupBarButtonItemTheme];
    
    //设置UINavigationBar的主题
    [self setupNavigationBarTheme];
    
    
}

/**
 *  设置UIBarButtonItem的主题
 */
+ (void)setupBarButtonItemTheme {
    //通过设置 appearance对象，能够修改整个项目中所有UIBarButtonItem的样式
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    //设置文字的属性
    //1.设置普通状态下文字的属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    //设置字体
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:16];
    //设置偏移量为0
    NSShadow *shadowDic=[[NSShadow alloc] init];
    [shadowDic setShadowOffset:CGSizeZero];
    textAttrs[NSShadowAttributeName] = shadowDic;
    
    //设置颜色为橙色
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //2.设置高亮状态下文字的属性
    NSMutableDictionary *hightextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    //设置颜色为红色
    hightextAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [appearance setTitleTextAttributes:hightextAttrs forState:UIControlStateHighlighted];
    
    //3.设置不可用状态下文字的属性
    NSMutableDictionary *disabletextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    disabletextAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [appearance setTitleTextAttributes:disabletextAttrs forState:UIControlStateDisabled];
    
}

/**
 *  设置UINavigationBar的主题
 */
+ (void)setupNavigationBarTheme {
    //通过设置 appearance对象，能够修改整个项目中所有UINavigationBar的样式
    UINavigationBar *appearance = [UINavigationBar appearance];
    appearance.tintColor = [UIColor whiteColor];
    
    //设置文字的属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    //设置字体
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:18];
    //设置偏移量为0
    //说明：UIOffsetZero是结构体，只有包装成NSValue对象才能放进字典中
    NSShadow *shadowDic=[[NSShadow alloc] init];
    [shadowDic setShadowOffset:CGSizeZero];
    textAttrs[NSShadowAttributeName] = shadowDic;
    //设置字体颜色
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [appearance setTitleTextAttributes:textAttrs];
    
    UIImage *backgroundImage = [self createImageWithColor:[UIColor colorWithRed:90/255.0 green:204/255.0 blue:250/255.0 alpha:1/1.0]];
    [appearance setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    [appearance setShadowImage:backgroundImage];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backAction
{
    [self popViewControllerAnimated:YES];
}

@end
