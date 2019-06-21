//
//  ViewController.m
//  conversionViewDemo
//
//  Created by 林睿强 on 2019/6/18.
//  Copyright © 2019年 Earnest Lin. All rights reserved.
//

#import "ViewController.h"

#import "LINConversionView.h"

#define btnWidth (self.view.bounds.size.width - btnMargin * 2 - segmentationLineViewWidth) / 2
#define btnHeight 50
#define btnMargin 100
#define segmentationLineViewWidth 1

@interface ViewController ()

@property (nonatomic ,strong) LINConversionView *conversionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUI];
}

#pragma mark - privateMethod
- (void)setUpUI {
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 250, 100, 100)];
    imageView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:.2];
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.center = CGPointMake(CGRectGetWidth(self.view.bounds)/2, CGRectGetHeight(self.view.bounds)/2);
    
    _conversionView = [[LINConversionView alloc] initWithContentView:imageView];
    _conversionView.scaleMode = LINConversionViewMode_Bounds;
    _conversionView.originalPoint = CGPointMake(0.2, 0.2);
    [_conversionView showOriginalPoint:YES];
    _conversionView.needPan = YES;
    _conversionView.needRotate = YES;
    _conversionView.needPinch  = YES;
    [_conversionView setTransformCtrlImage:[UIImage imageNamed:@"image_btn_resize"]];
    [_conversionView setResizeCtrlImage:[UIImage imageNamed:@"image_btn_resize"] rotateCtrlImage:[UIImage imageNamed:@"image_btn_rotate"]];
    [self.view addSubview:_conversionView];
    
    [self setUpButton];
    
}

- (void)setUpButton {
    UIButton *enlargeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    enlargeButton.frame = CGRectMake(btnMargin, CGRectGetHeight(self.view.bounds) - btnHeight * 2, btnWidth, btnHeight);
    enlargeButton.backgroundColor = UIColor.whiteColor;
    [enlargeButton setTitle:@"放大" forState:UIControlStateNormal];
    [enlargeButton addTarget:self action:@selector(enlargeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:enlargeButton];
    
    UIView *segmentationLineView = [[UIView alloc] init];
    segmentationLineView.frame = CGRectMake(btnMargin + btnWidth, CGRectGetHeight(self.view.bounds) - btnHeight * 2, segmentationLineViewWidth, btnHeight);
    segmentationLineView.backgroundColor = UIColor.lightGrayColor;
    [self.view addSubview:segmentationLineView];
    
    UIButton *lessenButton = [UIButton buttonWithType:UIButtonTypeSystem];
    lessenButton.frame = CGRectMake(btnMargin + btnWidth + segmentationLineViewWidth, CGRectGetHeight(self.view.bounds) - btnHeight * 2, btnWidth, btnHeight);
    lessenButton.backgroundColor = UIColor.whiteColor;
    [lessenButton setTitle:@"缩小" forState:UIControlStateNormal];
    [lessenButton addTarget:self action:@selector(lessenButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lessenButton];
}

#pragma mark - clickEvent

- (void)enlargeButtonAction:(id)sender {
    [_conversionView scaleByRate:1.1];
}

- (void)lessenButtonAction:(id)sender {
    [_conversionView scaleByRate:0.9];
}


@end
