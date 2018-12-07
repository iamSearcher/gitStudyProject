//
//  View1.m
//  yyyyy
//
//  Created by User on 2017/12/1.
//  Copyright © 2017年 User. All rights reserved.
//

#import "View1.h"

typedef void (^customSum)();

@interface View1 () <UIGestureRecognizerDelegate>


@end

@implementation View1

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

double(^CustomSum2)(double, double) = ^(double x, double y){
    return x + y;
};

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self p_method];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    
}

- (void)p_method
{
    double sum = CustomSum2(1.1, 13);
    
    CALayer *layer = [CALayer layer];
    [self.layer addSublayer:layer];
//    layer setValue:<#(nullable id)#> forKeyPath:<#(nonnull NSString *)#>
    
    
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    // layer 保持动画之后的状态，但是其值不会发生变化
    basicAnimation.removedOnCompletion = NO;
    layer.fillMode = kCAFillModeForwards;
    basicAnimation.duration = 2.0;
    basicAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    basicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    [layer addAnimation:basicAnimation forKey:@"movePosition"];
    
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[];
    
    [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    
    [CATransaction begin];
    CATransaction.disableActions = YES;
    layer.position = CGPointMake(0, 0);
    [CATransaction commit];
}

/// 暂停动画
- (void)pauseLayer:(CALayer *)layer
{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

/// 恢复动画
- (void)resumeLayer:(CALayer *)layer
{
    CFTimeInterval pausedTime = layer.timeOffset;
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}

@end
