//
//  UIImageView+CornerRadius.m
//  CornerRadiusImage
//
//  Created by gukong on 16/4/12.
//  Copyright © 2016年 nate. All rights reserved.
//

#import "UIImageView+CornerRadius.h"
#import "CornerRadiusImage.h"

@implementation UIImageView (CornerRadius)

- (void)setImage:(UIImage * __nonnull)image cornerRadius:(CGFloat)cornerRadius cacheKey:(NSString * __nullable)cacheKey {
    
    UIImage *convertImage = [[CornerRadiusImage sharedInstance] convertImage:image displayBoundSize:self.bounds.size cornerRadius:cornerRadius cacheKey:cacheKey];
    [self setImage:convertImage];
}

- (void)setImage:(UIImage * __nonnull)image cornerRadius:(CGFloat)cornerRadius placeholderImage:(UIImage * __nullable)placeholderImage cacheKey:(NSString * __nullable)cacheKey completion:(ImageViewCornerRadiusCompletion __nullable)completion {
    
    if (placeholderImage) {
        [self setImage:placeholderImage];
    }
    
    [[CornerRadiusImage sharedInstance] convertImage:image displayBoundSize:self.bounds.size cornerRadius:cornerRadius cacheKey:cacheKey completion:^(UIImage * _Nullable image, NSError * _Nullable error) {
        if (image) {
            [self setImage:image];
        }
        if (completion) {
            completion(image, error);
        }
    }];
}

- (void)setImageWithUrl:(NSURL * __nonnull)imageUrl cornerRadius:(CGFloat)cornerRadius placeholderImage:(UIImage * __nullable)placeholderImage {
    
    if (placeholderImage) {
        [self setImage:placeholderImage];
    }
    
    [[CornerRadiusImage sharedInstance] convertImageWithImageUrl:imageUrl displayBoundSize:self.bounds.size cornerRadius:cornerRadius completion:^(UIImage * _Nullable image, NSError * _Nullable error) {
        
        if (image) {
            [self setImage:image];
        }
    }];
}

- (void)setImageWithUrl:(NSURL * __nonnull)imageUrl cornerRadius:(CGFloat)cornerRadius placeholderImage:(UIImage * __nullable)placeholderImage completion:(ImageViewCornerRadiusCompletion __nullable)completion {
    
    if (placeholderImage) {
        [self setImage:placeholderImage];
    }
    
    [[CornerRadiusImage sharedInstance] convertImageWithImageUrl:imageUrl displayBoundSize:self.bounds.size cornerRadius:cornerRadius completion:^(UIImage * _Nullable image, NSError * _Nullable error) {
        
        if (image) {
            [self setImage:image];
        }
        if (completion) {
            completion(image, error);
        }
    }];
}
@end
