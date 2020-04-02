//
//  ViewController.m
//  ReadFBShimmering
//
//  Created by Bryant Reyn on 2020/4/1.
//  Copyright © 2020 Bryant Reyn. All rights reserved.
//

#import "ViewController.h"
#import "FBShimmering/FBShimmeringView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //渐变色
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.bounds;
    gradientLayer.startPoint = CGPointZero;
    gradientLayer.endPoint = CGPointMake(1, 1);
    gradientLayer.locations = @[@0.5,@0.5];
    gradientLayer.colors = [NSArray arrayWithObjects:
                            (id)[UIColor yellowColor].CGColor,
                            (id)[UIColor orangeColor].CGColor,
                            nil];
    [self.view.layer addSublayer:gradientLayer];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:ctx];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //如何把图片转换成二进流.
    NSData *data = UIImagePNGRepresentation(image);
    [data writeToFile:@"/Users/bryantreyn/Desktop/image.png" atomically:YES];
    
    //关闭上下文.
    UIGraphicsEndImageContext();
}

- (void)shimmeringView{
    self.view.backgroundColor = [UIColor blackColor];
    FBShimmeringView *shimmeringView = [[FBShimmeringView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:shimmeringView];
    
    UILabel *loadingLabel = [[UILabel alloc] initWithFrame:shimmeringView.bounds];
    loadingLabel.textAlignment = NSTextAlignmentCenter;
    loadingLabel.text = @"Shimmer";
    loadingLabel.textColor = [UIColor whiteColor];
    [loadingLabel setFont:[UIFont systemFontOfSize:50]];
    shimmeringView.contentView = loadingLabel;
    shimmeringView.shimmering = YES;
    //    [shimmeringView setShimmeringSpeed:3];
    //    [shimmeringView setShimmeringOpacity:0.5];
    //    [shimmeringView setShimmeringDirection:FBShimmerDirectionDown];
    //    [shimmeringView setShimmeringHighlightLength:10];
    [shimmeringView setShimmeringAnimationOpacity:0.7];
}

@end
