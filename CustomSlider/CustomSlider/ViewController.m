//
//  ViewController.m
//  CustomSlider
//
//  Created by iXiaobo on 14-11-25.
//  Copyright (c) 2014年 iXiaobo. All rights reserved.
//

#import "ViewController.h"
#import "DXBCustomSlider.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DXBCustomSlider *slider = [[DXBCustomSlider alloc] initWithFrame:CGRectMake(50, 100, 240, 20)];
    [slider addTarget:self action:@selector(updateRangeLabel:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)updateRangeLabel:(DXBCustomSlider *)slider{
    NSLog(@"Slider Range: %f - %f", slider.selectedMinimumValue, slider.selectedMaximumValue);
}

@end
