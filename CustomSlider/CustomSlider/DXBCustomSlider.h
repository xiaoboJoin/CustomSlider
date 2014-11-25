//
//  DXBCustomSlider.h
//  CustomSlider
//
//  Created by iXiaobo on 14-11-25.
//  Copyright (c) 2014年 iXiaobo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DXBCustomSlider : UIControl
{
    BOOL _maxThumbOn;
    BOOL _minThumbOn;
    
    float _padding;
    
    UIImageView * _minThumb;
    UIImageView * _maxThumb;
    UIImageView * _track;
    UIImageView * _trackBackground;
    
    float minimumValue;
    float maximumValue;
    float minimumRange;
    float selectedMinimumValue;
    float selectedMaximumValue;
}

@property(nonatomic) float minimumValue;
@property(nonatomic) float maximumValue;
@property(nonatomic) float minimumRange;
@property(nonatomic) float selectedMinimumValue;
@property(nonatomic) float selectedMaximumValue;


@end
