//
//  heartLive.m
//  heartLive
//
//  Created by zhujian on 2019/3/27.
//  Copyright © 2019 zhujian. All rights reserved.
//

#import "heartLive.h"
#import "UIView+Extension.h"
@interface heartLive()

@property(nonatomic,strong)NSMutableArray *rrnews;

@end
@implementation heartLive

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
        
        self.clearsContextBeforeDrawing = YES;
    }
    
    return self;
}

- (void)test{
    
    
}
- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    @autoreleasepool {
        /**
         *  这一步主要是屏蔽第一次启动时调用drawRect，将无效的值传入self.rrnews数组
         */
        if (self.isPass==NO) {
            
            return;
        }
        
        int mDrawHeight = rect.size.height;
        int  mDrawWidth = rect.size.width;
        float space = 4;
        int max_rrNew_count = mDrawWidth/space;
        
        [self.rrnews addObject:@(self.rrNew)];
        
        if (self.rrnews.count<2) {
            
            return;
        }
        
        if (self.rrnews.count>max_rrNew_count+1) {
            
            [self.rrnews removeObjectAtIndex:0];
        }
        
        int maxRR = [[self.rrnews valueForKeyPath:@"@max.intValue"] floatValue];
        //        int minRR = [[self.rrnews valueForKeyPath:@"@min.intValue"] floatValue];
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetLineWidth(context, 1.5);
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetLineJoin(context, kCGLineJoinRound);
        
        float y = 0;
        int oldX = 0;
        int value = [self.rrnews[1] floatValue];
        int oldY = value;
        
        for (int i=1; i<self.rrnews.count - 1; i++) {
            @autoreleasepool {
                CGPoint firstPoint = CGPointMake(oldX + space / 3 , [self.rrnews[i] floatValue]);
                CGPoint secondPoint = CGPointMake(oldX + space / 3 * (2), [self.rrnews[i + 1] floatValue]);
                y =  (maxRR >= 100) ? mDrawHeight * 0.75 : secondPoint.y;
                if (i==1) {
                    
                    CGContextMoveToPoint(context, oldX, value);
                }
                /**
                 *   cpY时控制点y值
                 */
                CGContextAddCurveToPoint(context, firstPoint.x, firstPoint.y, secondPoint.x, secondPoint.y, i*space, secondPoint.y);
                oldX = i*space;
                oldY = y;
            }
        }
        CGContextStrokePath(context);
    }
}

- (void)setRrNew:(float)rrNew{
    NSLog(@" %f",rrNew);
    _rrNew = rrNew;
    [self setNeedsDisplay];
}
- (NSMutableArray *)rrnews{
    if (!_rrnews) {
        _rrnews = [NSMutableArray array];
    }
    return _rrnews;
    
}

@end
