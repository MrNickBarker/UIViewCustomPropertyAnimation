//
//  OCView.m
//  UIViewCustomPropertyAnimation
//
//  Created by Nikola Lajic on 6/7/16.
//  Copyright © 2016 codecentric. All rights reserved.
//

#import "OCView.h"
#import "OCLayer.h"

@interface OCView ()
@property (nonatomic, readonly) UIView *percentView;
@property (nonatomic, readonly) UILabel *label;
@end

@implementation OCView
@synthesize percentView = _percentView;
@synthesize label = _label;

+ (Class)layerClass
{
    return [OCLayer class];
}

- (void)setPercent:(CGFloat)percent
{
    ((OCLayer *)self.layer).percent = percent;
}

- (CGFloat)percent
{
    return ((OCLayer *)self.layer).percent;
}

- (void)displayLayer:(CALayer *)layer
{
    CGFloat percent = [(OCLayer*)self.layer.presentationLayer percent];
    CGFloat width = CGRectGetWidth(self.frame) * (percent / 100);
    self.percentView.frame = CGRectMake(0, 0, width, CGRectGetHeight(self.frame));
    self.label.text = [NSString stringWithFormat:@"%.0f", floorf(percent)];
}

#pragma mark - 

- (UIView *)percentView
{
    if (!_percentView)
    {
        _percentView = [[UIView alloc] initWithFrame:self.bounds];
        self.percentView.backgroundColor = [UIColor redColor];
        [self addSubview:self.percentView];
    }
    return _percentView;
}

- (UILabel *)label
{
    if (!_label)
    {
        _label = [[UILabel alloc] initWithFrame:self.bounds];
        _label.font = [UIFont boldSystemFontOfSize:30];
        _label.textColor = [UIColor blackColor];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
    }
    return _label;
}

@end
