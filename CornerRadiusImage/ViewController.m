//
//  ViewController.m
//  CornerRadiusImage
//
//  Created by gukong on 16/4/11.
//  Copyright © 2016年 nate. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+CornerRadius.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *displayImageView;
@property (strong, nonatomic) IBOutlet UIImageView *displayImageView1;
@property (strong, nonatomic) IBOutlet UIImageView *displayImageView2;
@property (strong, nonatomic) IBOutlet UIImageView *displayImageView3;
@property (strong, nonatomic) IBOutlet UIImageView *displayImageView4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [UIImage imageNamed:@"activity1"];
    [_displayImageView setImage:image];
    
    UIImage *display1 = [image imageAspectFitBoundingSize:_displayImageView1.bounds.size cornerRadius:10.f];
    [_displayImageView1 setImage:display1];
    [_displayImageView1 setContentMode:UIViewContentModeScaleAspectFit];
    
    UIImage *display2 = [image imageAspectFillBoundingSize:_displayImageView2.bounds.size cornerRadius:15.f];
    [_displayImageView2 setImage:display2];
    [_displayImageView2 setContentMode:UIViewContentModeScaleAspectFill];
    
    UIImage *display3 = [image imageAspectFitBoundingSize:_displayImageView3.bounds.size cornerRadius:5.f];
    [_displayImageView3 setImage:display3];
    [_displayImageView3 setContentMode:UIViewContentModeScaleAspectFit];
    
    UIImage *display4 = [image imageAspectFillBoundingSize:_displayImageView4.bounds.size cornerRadius:8.f];
    [_displayImageView4 setImage:display4];
    [_displayImageView4 setContentMode:UIViewContentModeScaleAspectFill];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
