//
//  ViewController.m
//  CornerRadiusImage
//
//  Created by gukong on 16/4/11.
//  Copyright © 2016年 nate. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+CornerRadius.h"
#import "UIImageView+CornerRadius.h"
#import "UIButton+CornerRadius.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *displayImageView;
@property (strong, nonatomic) IBOutlet UIImageView *displayImageView1;
@property (strong, nonatomic) IBOutlet UIImageView *displayImageView2;
@property (strong, nonatomic) IBOutlet UIImageView *displayImageView3;
@property (strong, nonatomic) IBOutlet UIImageView *displayImageView4;
@property (strong, nonatomic) IBOutlet UIButton *displayButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [UIImage imageNamed:@"activity1"];
    [_displayImageView setContentMode:UIViewContentModeScaleAspectFill];
    [_displayImageView setImageWithUrl:[NSURL URLWithString:@"http://tse2.mm.bing.net/th?id=OIP.Me59b5ae806255da0cafda24dc118d7cbo0&pid=15.1"] cornerRadius:10.f placeholderImage:nil];
    
    UIImage *display1 = [image imageAspectFitBoundingSize:_displayImageView1.bounds.size cornerRadius:10.f];
    [_displayImageView1 setContentMode:UIViewContentModeScaleAspectFit];
    [_displayImageView1 setImage:display1];
    
    [_displayImageView2 setContentMode:UIViewContentModeScaleAspectFill];
    [_displayImageView2 setImage:image cornerRadius:20.f cacheKey:@"_displayImageView2"];
    
    UIImage *display3 = [image imageAspectFitBoundingSize:_displayImageView3.bounds.size cornerRadius:5.f];
    [_displayImageView3 setContentMode:UIViewContentModeScaleAspectFit];
    [_displayImageView3 setImage:display3];
    
    UIImage *display4 = [image imageAspectFillBoundingSize:_displayImageView4.bounds.size cornerRadius:8.f];
    [_displayImageView4 setContentMode:UIViewContentModeScaleAspectFill];
    [_displayImageView4 setImage:display4];
    
    [_displayButton.imageView setContentMode:UIViewContentModeScaleAspectFill];
    [_displayButton setImage:image forState:UIControlStateNormal cornerRadius:5 cacheKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
