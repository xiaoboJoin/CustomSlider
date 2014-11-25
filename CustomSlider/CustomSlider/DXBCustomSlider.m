//
//  DXBCustomSlider.m
//  CustomSlider
//
//  Created by iXiaobo on 14-11-25.
//  Copyright (c) 2014年 iXiaobo. All rights reserved.
//

#import "DXBCustomSlider.h"

@implementation DXBCustomSlider
@synthesize minimumValue, maximumValue, minimumRange, selectedMinimumValue, selectedMaximumValue;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _minThumbOn = false;
        _maxThumbOn = false;
        _padding = 20; // 20 is a good value
    
        minimumValue = 0;
        maximumValue = 200;
        selectedMaximumValue = 100;
        selectedMinimumValue = 10;
        
        _trackBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bar-background.png"]] ;
        _trackBackground.contentMode = UIViewContentModeScaleToFill;
        _trackBackground.frame = CGRectMake((frame.size.width - _trackBackground.frame.size.width) / 2, (frame.size.height - _trackBackground.frame.size.height) / 2, _trackBackground.frame.size.width, _trackBackground.frame.size.height);
        [self addSubview:_trackBackground];
        
        _track = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bar-highlight.png"]];
        _track.frame = CGRectMake((frame.size.width - _track.frame.size.width) / 2, (frame.size.height - _track.frame.size.height) / 2, _track.frame.size.width, _track.frame.size.height);
         _track.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:_track];
        
        _minThumb = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"handle.png"] highlightedImage:[UIImage imageNamed:@"handle-hover.png"]] ;
        _minThumb.contentMode = UIViewContentModeScaleToFill;
        
        _minThumb.center = CGPointMake([self xForValue:selectedMinimumValue],  self.frame.size.height / 2);
        [self addSubview:_minThumb];
        
        
        
        _maxThumb = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"handle.png"] highlightedImage:[UIImage imageNamed:@"handle-hover.png"]] ;
        _maxThumb.center = CGPointMake([self xForValue:selectedMaximumValue],  self.frame.size.height / 2);
        _maxThumb.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:_maxThumb];
        [self updateTrackHighlight];
        
        
    }
    return self;
    
}

-(float)xForValue:(float)value{
    return (self.frame.size.width-(_padding*2))*((value - minimumValue) / (maximumValue - minimumValue))+_padding;
}

-(BOOL) beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchPoint = [touch locationInView:self];
    if(CGRectContainsPoint(_minThumb.frame, touchPoint)){
        _minThumbOn = true;
    }else if(CGRectContainsPoint(_maxThumb.frame, touchPoint)){
        _maxThumbOn = true;
    }
    return YES;
}


-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    _minThumbOn = false;
    _maxThumbOn = false;
}

-(BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    if(!_minThumbOn && !_maxThumbOn){
        return YES;
    }
    
    CGPoint touchPoint = [touch locationInView:self];
    if(_minThumbOn){
        _minThumb.center = CGPointMake(MAX([self xForValue:minimumValue],MIN(touchPoint.x, [self xForValue:selectedMaximumValue - minimumRange])), _minThumb.center.y);
        
    }
    if(_maxThumbOn){
        _maxThumb.center = CGPointMake(MIN([self xForValue:maximumValue], MAX(touchPoint.x, [self xForValue:selectedMinimumValue + minimumRange])), _maxThumb.center.y);
    }
    [self updateTrackHighlight];
  
    [self setNeedsDisplay];
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    return YES;
}


-(void)updateTrackHighlight{
    _track.frame = CGRectMake(
                              _minThumb.center.x,
                              _track.center.y - (_track.frame.size.height/2),
                              _maxThumb.center.x - _minThumb.center.x,
                              _track.frame.size.height
                              );
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
