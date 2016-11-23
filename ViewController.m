//
//  ViewController.m
//  myCategary
//
//  Created by zyyt on 16/9/1.
//  Copyright © 2016年 zyyt. All rights reserved.
//

#import "ViewController.h"
#import "CLMacro.h"
#import "CLNextViewController.h"
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface ViewController ()
Array_(dataArray);
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//
//    NSString *string = @"北京欢迎你";
//    NSLog(@"%@",[string CL_PINYINFirst]);
//    
//    string = @"北京欢迎你北京欢迎你北京欢迎你北京欢迎你北京欢迎你北京欢迎你北京欢迎你北京欢迎你北京欢迎你北京欢迎你北京欢迎你北京欢迎你";
//    NSLog(@"%lf",[string CL_widthWithFontSize:12 constrainedToHeight:30]);
//    NSLog(@"%lf",[string CL_heightWithFontSize:12 constrainedToWidth:100]);
//    NSLog(@"%lf",[string CL_widthWithFont:[UIFont systemFontOfSize:12] constrainedToHeight:30]);
//    NSLog(@"%lf",[string CL_heightWithFont:[UIFont systemFontOfSize:12] constrainedToWidth:30]);
//
//    string = @"😀上课骄傲    的了那份👌";
//    NSLog(@"%d",[string CL_isIncludingEmoji]);
//    NSLog(@"%@",[string CL_removedEmojiString]);
//    NSLog(@"%d",[string CL_isIncludingSpace]);
//    NSLog(@"%@",[string CL_removedSpace]);


////    string = @"{\"field\": \"value\"}";
////    NSString *str = [string CL_dictionaryFromJsonString][@"fields"];
////    NSLog(@"%@",str);
//    NSMutableArray *array = [@[@"value", @"value1"]     mutableCopy];
//    [array lastObject];
//    
//    [array removeObject:@"value"];
//    [array removeObject:nil];
//    [array addObject:@"12"];
//    [array addObject:nil];
//    [array insertObject:nil atIndex:0];
//    [array insertObject:@"sdf" atIndex:10];
//    [array objectAtIndex:100];
//    [array removeObjectAtIndex:10];
//    
//    NSMutableArray *anotherArray = [[NSMutableArray alloc] init];
//    [anotherArray objectAtIndex:0];
//    
//    NSString *nilStr = nil;
//    NSArray *array1 = @[@"ara", @"sdf", @"dsfdsf", nilStr];
//    NSLog(@"array1.count = %lu", array1.count);
//    
//    // 测试数组中有数组
//    NSArray *array2 = @[@[@"12323", @"nsdf", nilStr],     @[@"sdf", @"nilsdf", nilStr, @"sdhfodf"]];
    
    
//    self.view.backgroundColor = [[UIColor redColor]CL_lightenColor:0.5];
    
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    layer.frame = CGRectMake(100, 100, 300, 300);
//    layer.path = [UIBezierPath bezierPathWithText:@"你好" font:[UIFont systemFontOfSize:18]].CGPath;
//    [self.view.layer addSublayer:layer];
    [self ADD];
}
- (void)ADD{
    
    UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(0,100, 300, 44)];
//    text.backgroundColor = [UIColor redColor];
    [text CL_getSearchImage:[UIColor blackColor]];
    text.maxLength = 12;
    [self.view addSubview:text];
    
    /**
     *  比较数组
     */
    NSMutableArray *marr = [NSMutableArray arrayWithArray: @[@"1",@"0",@"4",@"30",@"5",@"6"]];
    [marr sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *string1 = obj1;
        NSString *string2 = obj2;
        return [string1 compare:string2];
    }];
    NSLog(@"%@",marr);
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 200, 100, 100)];
    [image cl_setImageWithString:@"CA"];
    [self.view addSubview:image];
    UIImageView *imageW = [[UIImageView alloc]initWithFrame:CGRectMake(0, 200, 100, 100)];
    [imageW cl_setImageWithString:@"CB"];
    [self.view addSubview:imageW];
//    self.view.backgroundColor = [UIColor redColor];
//    
//    
//    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    
//    [self.view addSubview:backgroundView];
//    
//    
//    UIView *leftView =  [[UIView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH*2/3, SCREEN_HEIGHT)];
//    
//    leftView.backgroundColor = [UIColor orangeColor];
//    
//    UITextField *defaultfield = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, 200, 30)];
//    defaultfield.borderStyle = UITextBorderStyleRoundedRect;
//    [leftView addSubview:defaultfield];
//    
//    
//    //默认为self.view视图移动，与textfield底部距离键盘顶部的距离为10
//    UITextField *field2 = [[UITextField alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 200, 200, 30)];
//    [leftView addSubview:field2];
//    field2.placeholder = @"self.view 视图移动";
//    field2.borderStyle = UITextBorderStyleRoundedRect;
//    [backgroundView addSubview:leftView];
//    
//    UIView *rtView =  [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*2/3,0, SCREEN_WIDTH/3, SCREEN_HEIGHT)];
//    rtView.backgroundColor = [UIColor clearColor];
//    
//    //设置不移动
//    UITextField *field3 = [[UITextField alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 200, 80, 30)];
//    [leftView addSubview:field3];
//    field3.placeholder = @"不移动";
//    field3.borderStyle = UITextBorderStyleRoundedRect;
//    field3.cl_canMove = NO;
//    [rtView addSubview:field3];
//    
//    [backgroundView addSubview:rtView];
//    
//    UIView *topView = [[UIView alloc] init];
//    topView.frame   = CGRectMake(0,0, leftView.frame.size.width, 100);
//    topView.backgroundColor = [UIColor brownColor];
//    [leftView addSubview:topView];
//    
//    
//    UIView *topView02 = [[UIView alloc] init];
//    topView02.frame   = CGRectMake(0,0, rtView.frame.size.width, SCREEN_HEIGHT-200);
//    topView02.backgroundColor = [UIColor blueColor];
//    [rtView addSubview:topView02];
//    
//    
//    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 100 ,SCREEN_WIDTH, 100 )];
//    footerView.backgroundColor = [UIColor yellowColor];
//    [backgroundView addSubview:footerView];
//    
//    //设置移动的父视图
//    UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(0, 0,leftView.frame.size.width - 44, 44 )];
//    field.placeholder = @"backgroundView 视图移动";
//    field.borderStyle = UITextBorderStyleRoundedRect;
//    [footerView  addSubview:field];
//    
//    field.cl_heightToKeyboard = 0;
//    field.cl_moveView = backgroundView;
//    
//    //设置textfield底部距离键盘顶部的距离
//    UITextField *moveFieldheight = [[UITextField alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 250, 200, 30)];
//    moveFieldheight.borderStyle = UITextBorderStyleRoundedRect;
//    moveFieldheight.cl_heightToKeyboard = 100;
//    moveFieldheight.cl_moveView = leftView;
//    moveFieldheight.placeholder = [NSString stringWithFormat:@"距离为%fpx",moveFieldheight.cl_heightToKeyboard];
//    [leftView addSubview:moveFieldheight];
    
    
    UIButton *BUTTON = [UIButton buttonWithType:UIButtonTypeSystem];
    BUTTON.frame = CGRectMake(100, 200, 100, 100);
    [BUTTON setTitle:@"点击一下" forState:UIControlStateNormal];
//    [BUTTON addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [BUTTON cl_addTargeActionHandler:^(UIButton *myButton,NSInteger tag) {
        [self.navigationController pushViewController:[CLNextViewController alloc].init animated:YES];
    }];
    [self.view addSubview:BUTTON];
    [BUTTON cl_beginSubmitting:UIActivityIndicatorViewStyleGray];
    [BUTTON cl_endSubmitting];
}
- (void)rightButtonClick:(UIButton *)sender{
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
