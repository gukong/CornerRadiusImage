//
//  UIImage+CornerRadius.m
//  CornerRadiusImage
//
//  Created by gukong on 16/4/11.
//  Copyright © 2016年 nate. All rights reserved.
//

#import "UIImage+CornerRadius.h"

@implementation UIImage (CornerRadius)

#pragma mark - get scale size
- (CGSize)CGSizeAspectFit:(CGSize)aspectRatio bounding:(CGSize) boundingSize {
    float mW = boundingSize.width / aspectRatio.width;
    float mH = boundingSize.height / aspectRatio.height;
    if( mH < mW )
        boundingSize.width = mH * aspectRatio.width;
    else if( mW < mH )
        boundingSize.height = mW * aspectRatio.height;
    return boundingSize;
}

- (CGSize)CGSizeAspectFill:(CGSize)aspectRatio bounding:(CGSize)minimumSize {
    float mW = minimumSize.width / aspectRatio.width;
    float mH = minimumSize.height / aspectRatio.height;
    if( mH > mW )
        minimumSize.width = mH * aspectRatio.width;
    else if( mW > mH )
        minimumSize.height = mW * aspectRatio.height;
    return minimumSize;
}

#pragma mark - scale to crop
- (UIImage *)imageAspectFitBoundingSize:(CGSize)boundingSize cornerRadius:(CGFloat)cornerRadius {
    return [self imageAspectFitBoundingSize:boundingSize cornerRadius:cornerRadius borderWidth:0 borderColor:nil];
}

- (UIImage *)imageAspectFitBoundingSize:(CGSize)boundingSize cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    CGSize aspectFitSize = [self CGSizeAspectFit:self.size bounding:boundingSize];
    return [self imageScaledToSize:aspectFitSize boundingSize:boundingSize cornerRadius:cornerRadius borderWidth:borderWidth borderColor:borderColor];
}

- (UIImage *)imageAspectFillBoundingSize:(CGSize)boundingSize cornerRadius:(CGFloat)cornerRadius {
    return [self imageAspectFillBoundingSize:boundingSize cornerRadius:cornerRadius borderWidth:0 borderColor:nil];
}

- (UIImage *)imageAspectFillBoundingSize:(CGSize)boundingSize cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    CGSize aspectFillSize = [self CGSizeAspectFill:self.size bounding:boundingSize];
    return [self imageScaledToSize:aspectFillSize boundingSize:boundingSize cornerRadius:cornerRadius borderWidth:borderWidth borderColor:borderColor];
}

#pragma mark - crop cornerRadius
- (UIImage *)imageScaledToSize:(CGSize)size boundingSize:(CGSize)boundingSize cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    @autoreleasepool {
        //create drawing context
        UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
        
        boundingSize.height -= borderWidth;
        boundingSize.width -= borderWidth;
        
        CGSize visibleSize = size;
        if (size.width+size.height > boundingSize.width+boundingSize.height) {
            visibleSize = boundingSize;
        }
        
        CGFloat originX = (size.width - visibleSize.width)/2;
        originX = originX < 0 ? 0 : originX;
    
        CGFloat originY = (size.height - visibleSize.height)/2;
        originY = originY < 0 ? 0 : originY;
        
        [borderColor setStroke];
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(originX, originY, visibleSize.width, visibleSize.height) cornerRadius:cornerRadius];
        [bezierPath setLineWidth:borderWidth];
        [bezierPath stroke];
        [bezierPath addClip];
        
        //draw
        [self drawInRect:CGRectMake(0.f, 0.f, size.width, size.height)];
        
        //capture resultant image
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        //return image
        return image;
    }
}
@end
