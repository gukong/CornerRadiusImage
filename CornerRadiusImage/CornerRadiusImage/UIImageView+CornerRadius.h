//
//  UIImageView+CornerRadius.h
//  CornerRadiusImage
//
//  Created by gukong on 16/4/12.
//  Copyright © 2016年 nate. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ImageViewCornerRadiusCompletion)(UIImage * __nullable image, NSError * __nullable error);

@interface UIImageView (CornerRadius)

/**
 *  设置图片，会先处理 image 成带有圆角的 image
 *  会缓存处理过的 image
 *
 *  @param image        原图 image
 *  @param cornerRadius 圆角半径
 *  @param cacheKey     缓存 key
 */
- (void)setImage:(UIImage * __nonnull)image cornerRadius:(CGFloat)cornerRadius cacheKey:(NSString * __nullable)cacheKey;

/**
 *  设置图片，会先处理 image 成带有圆角的 image
 *  会缓存处理过的 image
 *  处理圆角完成之前，先设置一个 占位图
 *
 *  @param image            原图 image
 *  @param cornerRadius     圆角半径
 *  @param placeholderImage 处理圆角完成之前，先设置一个 placeholderimage
 *  @param cacheKey         缓存 key
 *  @param completion       完成处理圆角，设置到 UIImageView 后，再回调
 */
- (void)setImage:(UIImage * __nonnull)image cornerRadius:(CGFloat)cornerRadius placeholderImage:(UIImage * __nullable)placeholderImage cacheKey:(NSString * __nullable)cacheKey completion:(ImageViewCornerRadiusCompletion __nullable)completion;

/**
 *  通过 imageUrl 来下载图片
 *  处理下载完成的图片为带有圆角的图片
 *
 *  @param imageUrl     下载图片的url
 *  @param cornerRadius 圆角半径
 *  @param placeholderImage 占位图
 */
- (void)setImageWithUrl:(NSURL * __nonnull)imageUrl cornerRadius:(CGFloat)cornerRadius placeholderImage:(UIImage * __nullable)placeholderImage;

/**
 *  通过 imageUrl 来下载图片
 *  处理下载完成的图片为带有圆角的图片
 *  下载完成之前，有一个占位图
 *  下载完成，处理圆角，设置图片，再回调
 *
 *  @param imageUrl         下载图片的url
 *  @param cornerRadius     圆角半径
 *  @param placeholderImage 占位图
 *  @param completion       下载完成，处理圆角，设置图片，再回调
 */
- (void)setImageWithUrl:(NSURL * __nonnull)imageUrl cornerRadius:(CGFloat)cornerRadius placeholderImage:(UIImage * __nullable)placeholderImage completion:(ImageViewCornerRadiusCompletion __nullable)completion;

@end
