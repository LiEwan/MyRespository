//
//  heartLive.h
//  heartLive
//
//  Created by zhujian on 2019/3/27.
//  Copyright © 2019 zhujian. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface heartLive : UIView
/**
 *  传递的值
 */
@property(nonatomic,assign)float rrNew;
/**
 *  开始画图时isPass属性设置为YES
 */
@property(nonatomic,assign)BOOL isPass;
@end

NS_ASSUME_NONNULL_END
