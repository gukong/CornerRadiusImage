//
//  UIButton+CornerRadius.m
//  CornerRadiusImage
//
//  Created by gukong on 16/4/12.
//  Copyright © 2016年 nate. All rights reserved.
//

#import "UIButton+CornerRadius.h"
#import "CornerRadiusImage.h"

@implementation UIButton (CornerRadius)

- (void)setImage:(UIImage * __nonnull)image forState:(UIControlState)state cornerRadius:(CGFloat)cornerRadius cacheKey:(NSString * __nullable)cacheKey {
    UIImage *convertImage = [[CornerRadiusImage sharedInstance] convertImage:image displayBoundSize:self.bounds.size cornerRadius:cornerRadius cacheKey:cacheKey];
    convertImage = [convertImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self setImage:convertImage forState:state];
}

- (void)setImage:(UIImage * __nonnull)image forState:(UIControlState)state cornerRadius:(CGFloat)cornerRadius placeholderImage:(UIImage * __nullable)placeholderImage cacheKey:(NSString * __nullable)cacheKey completion:(ButtonCornerRadiusCompletion __nullable)completion {
    if (placeholderImage) {
        [self setImage:placeholderImage forState:state];
    }
    
    [[CornerRadiusImage sharedInstance] convertImage:image displayBoundSize:self.bounds.size cornerRadius:cornerRadius cacheKey:cacheKey completion:^(UIImage * _Nullable image, NSError * _Nullable error) {
        if (image) {
            [self setImage:image forState:state];
        }
        if (completion) {
            completion(image, error);
        }
    }];
}

- (void)setImageWithUrl:(NSURL * __nonnull)imageUrl forState:(UIControlState)state cornerRadius:(CGFloat)cornerRadius placeholderImage:(UIImage * __nullable)placeholderImage {
    if (placeholderImage) {
        [self setImage:placeholderImage forState:state];
    }
    
    [[CornerRadiusImage sharedInstance] convertImageWithImageUrl:imageUrl displayBoundSize:self.bounds.size cornerRadius:cornerRadius completion:^(UIImage * _Nullable image, NSError * _Nullable error) {
        
        if (image) {
            [self setImage:image forState:state];
        }
    }];
}

- (void)setImageWithUrl:(NSURL * __nonnull)imageUrl forState:(UIControlState)state cornerRadius:(CGFloat)cornerRadius placeholderImage:(UIImage * __nullable)placeholderImage completion:(ButtonCornerRadiusCompletion __nullable)completion {
    if (placeholderImage) {
        [self setImage:placeholderImage forState:state];
    }
    
    [[CornerRadiusImage sharedInstance] convertImageWithImageUrl:imageUrl displayBoundSize:self.bounds.size cornerRadius:cornerRadius completion:^(UIImage * _Nullable image, NSError * _Nullable error) {
        
        if (image) {
            [self setImage:image forState:state];
        }
        if (completion) {
            completion(image, error);
        }
    }];
}
@end
