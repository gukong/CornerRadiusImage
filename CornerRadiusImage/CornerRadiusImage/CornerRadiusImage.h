//
//  CornerRadiusImage.h
//  CornerRadiusImage
//
//  Created by gukong on 16/4/11.
//  Copyright © 2016年 nate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^CRIConvertCompletion)(UIImage * __nullable image, NSError * __nullable error);

@interface CornerRadiusImage : NSObject

+ (nullable instancetype)sharedInstance;

/**
 *  转换 UIImage 成圆角的 UIimage，会存放到 Cache 当中
 *  转换之前会到 Cache 当中查找
 *
 *  @param image                原图
 *  @param displayBoundSize     展示图片区域的size
 *  @param cornerRadius         圆角半径
 *  @param cacheKey             存放到 Cache 当中需要的 Key, key为空表示不使用缓存
 *
 *  @return 带有圆角的图片
 */
- (UIImage * __nullable)convertImage:(UIImage * __nonnull)image displayBoundSize:(CGSize)boundSize cornerRadius:(CGFloat)cornerRadius cacheKey:(NSString * __nullable)cacheKey;

/**
 *  转换 UIImage 成圆角的 UIimage
 *
 *  @param image                原图
 *  @param displayBoundSize     展示图片区域的size
 *  @param cornerRadius         圆角半径
 *  @param cacheKey             存放到 Cache 当中需要的 Key, key为空表示不使用缓存
 *  @param completion           完成后回调block
 */
- (void)convertImage:(UIImage * __nonnull)image displayBoundSize:(CGSize)boundSize cornerRadius:(CGFloat)cornerRadius cacheKey:(NSString * __nullable)cacheKey completion:(CRIConvertCompletion __nullable)completion;

/**
 *  转换 UIImage 成圆角的 UIimage
 *
 *  @param imageUrl             网络图片的url，该方法会调用 SDWebImage 相关方法
 *  @param displayBoundSize     展示图片区域的size
 *  @param cornerRadius         圆角半径
 *  @param completion           完成后回调block
 */
- (void)convertImageWithImageUrl:(NSURL * __nonnull)imageUrl displayBoundSize:(CGSize)boundSize cornerRadius:(CGFloat)cornerRadius completion:(CRIConvertCompletion __nullable)completion;
@end
