//
//  CustomView.m
//  NSNotificationCenterKVOAssignment
//
//  Created by Bennett on 2018-08-11.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(BOOL)gestureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    
    self.point = [gestureRecognizer translationInView:self];
    return YES;
}

@end
