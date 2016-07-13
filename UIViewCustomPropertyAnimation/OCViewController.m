//
//  OCViewController.m
//  UIViewCustomPropertyAnimation
//
//  Created by Nikola Lajic on 6/7/16.
//  Copyright © 2016 codecentric. All rights reserved.
//

#import "OCViewController.h"
#import "OCView.h"

@interface OCViewController ()
@property (nonatomic, weak) IBOutlet OCView *animView;
@end

@implementation OCViewController
static const NSTimeInterval kAnimDuration = 2.0;

- (IBAction)defaultAnimation:(id)sender
{
    self.animView.percent = 0.0;
    [UIView animateWithDuration:kAnimDuration
                     animations:^{
                         self.animView.percent = 100.0;
                     }];
}

- (IBAction)easeOutAnimation:(id)sender
{
    self.animView.percent = 0.0;
    [UIView animateWithDuration:kAnimDuration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAutoreverse
                     animations:^{
                         self.animView.percent = 100.0;
                     } completion:^(BOOL finished) {
                         if (finished)
                         {
                             self.animView.percent = 0.0;
                         }
                     }];
}

- (IBAction)springAnimation:(id)sender
{
    self.animView.percent = 0.0;
    [UIView animateWithDuration:kAnimDuration
                          delay:0.0
         usingSpringWithDamping:0.4
          initialSpringVelocity:0.6
                        options:0
                     animations:^{
                         self.animView.percent = 100.0;
                     } completion:nil];
}

@end
