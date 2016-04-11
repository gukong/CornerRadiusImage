//
//  UIImage+CornerRadius.h
//  CornerRadiusImage
//
//  Created by gukong on 16/4/11.
//  Copyright © 2016年 nate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CornerRadius)

/**
 *  显示完整的 image 到 boundingSize 区域
 *
 *  @param originSize  图片原始size
 *  @param boundingSize 约束图片展示的size
 *
 *  @return originSize 被 约束在 boundingSize 之内，实际的size
 */
- (CGSize)CGSizeAspectFit:(CGSize)originSize bounding:(CGSize) boundingSize;

/**
 *  显示部分 image，填充满 boundingSize区域
 *
 *  @param originSize 图片原始size
 *  @param boundingSize 约束图片展示的size
 *
 *  @return originSize 缩放后刚好填充满 boundingSize ，实际的size
 */
- (CGSize)CGSizeAspectFill:(CGSize)originSize bounding:(CGSize)boundingSize;

/**
 *  以 AspectFit 的方式缩放图片，并裁剪圆角
 *
 *  @param boundingSize 显示图片区域的 Size
 *  @param cornerRadius 圆角半径
 *
 *  @return 缩放、裁剪圆角之后的 UIImage
 */
- (UIImage *)imageAspectFitBoundingSize:(CGSize)boundingSize cornerRadius:(CGFloat)cornerRadius;

/**
 *  以 AspectFit 的方式缩放图片，并裁剪圆角
 *
 *  @param boundingSize boundingSize 显示图片区域的 Size
 *  @param cornerRadius cornerRadius 圆角半径
 *  @param borderWidth  边框的宽
 *  @param borderColor  边框的颜色
 *
 *  @return 缩放、裁剪圆角之后的 UIImage，带有边框
 */
- (UIImage *)imageAspectFitBoundingSize:(CGSize)boundingSize cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 *  以 AspectFill 的方式缩放图片，并裁剪圆角
 *
 *  @param boundingSize 显示图片区域的 Size
 *  @param cornerRadius 圆角半径
 *
 *  @return 缩放、裁剪圆角之后的 UIImage
 */
- (UIImage *)imageAspectFillBoundingSize:(CGSize)boundingSize cornerRadius:(CGFloat)cornerRadius;

/**
 *  以 AspectFill 的方式缩放图片，并裁剪圆角
 *
 *  @param boundingSize boundingSize 显示图片区域的 Size
 *  @param cornerRadius cornerRadius 圆角半径
 *  @param borderWidth  边框的宽
 *  @param borderColor  边框的颜色
 *
 *  @return 缩放、裁剪圆角之后的 UIImage，带有边框
 */
- (UIImage *)imageAspectFillBoundingSize:(CGSize)boundingSize cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
@end
