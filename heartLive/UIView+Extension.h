//
//  UIView+Extension.h
//  heartLive
//
//  Created by zhujian on 2019/3/27.
//  Copyright © 2019 zhujian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat maxX;
@property (nonatomic, assign) CGFloat maxY;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

- (BOOL)isShowingOnKeyWindow;

+ (instancetype)viewFromXib;
@end

NS_ASSUME_NONNULL_END
