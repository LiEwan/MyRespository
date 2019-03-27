//
//  ViewController.m
//  heartLive
//
//  Created by zhujian on 2019/3/27.
//  Copyright © 2019 zhujian. All rights reserved.
//
#import "heartLive.h"
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) heartLive *heartLive;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"1");
    [self.view addSubview:self.heartLive];
    self.heartLive.isPass = YES;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.3f target:self selector:@selector(startTime) userInfo:nil repeats:YES];
    [timer fire];
}
- (void)startTime{
    for (int i = 0; i < 600; i ++) {
        CGFloat value = arc4random() % 125 + 50.0;
        [self drawLine:value];
    }
}
- (void)drawLine:(CGFloat)value{
    self.heartLive.rrNew = value;
}
- (heartLive *)heartLive{
    if (!_heartLive) {
        
        _heartLive = [[heartLive alloc] initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 200)];
        _heartLive.backgroundColor = [UIColor blueColor];
    }
    return _heartLive;
}
@end
