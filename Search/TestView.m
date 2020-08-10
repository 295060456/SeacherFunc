//
//  TestView.m
//  Search
//
//  Created by Jobs on 2020/8/10.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "TestView.h"

@implementation TestView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [TestView addButtonAnimation:self];
}


+ (void)addButtonAnimation:(UIView *)sender{
    sender.transform = CGAffineTransformIdentity;
    [UIView animateKeyframesWithDuration:0.5
                                   delay:0
                                 options:0
                              animations: ^{
        [UIView addKeyframeWithRelativeStartTime:0
                                relativeDuration:1 / 3.0
                                      animations: ^{
            sender.transform = CGAffineTransformMakeScale(1.5, 1.5);
        }];
        [UIView addKeyframeWithRelativeStartTime:1/3.0
                                relativeDuration:1/3.0
                                      animations: ^{
            sender.transform = CGAffineTransformMakeScale(0.8, 0.8);
        }];
        [UIView addKeyframeWithRelativeStartTime:2/3.0
                                relativeDuration:1/3.0
                                      animations: ^{

            sender.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    } completion:nil];
}


@end
