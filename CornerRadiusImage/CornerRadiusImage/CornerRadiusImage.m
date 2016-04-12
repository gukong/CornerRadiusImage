//
//  CornerRadiusImage.m
//  CornerRadiusImage
//
//  Created by gukong on 16/4/11.
//  Copyright © 2016年 nate. All rights reserved.
//

#import "CornerRadiusImage.h"
#import "UIImage+CornerRadius.h"
#import "SDWebImageDownloader.h"

@interface CornerRadiusImage ()
@property (nonatomic, strong) NSCache *imageCache;
@property (nonatomic, strong) dispatch_queue_t imageQueue;
@end

@implementation CornerRadiusImage

#pragma mark - 初始化
static CornerRadiusImage *_sharedInstance;
+ (nullable instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[CornerRadiusImage alloc] init];
        [_sharedInstance initP];
    });
    return _sharedInstance;
}

- (void)initP {
    _imageCache = [[NSCache alloc] init];
    _imageQueue = dispatch_queue_create("CornerRadiusImage", DISPATCH_QUEUE_CONCURRENT);
}

#pragma mark - 同步返回图片
- (UIImage * __nullable)convertImage:(UIImage * __nonnull)image displayBoundSize:(CGSize)boundSize cornerRadius:(CGFloat)cornerRadius cacheKey:(NSString * __nullable)cacheKey {
    if (cacheKey.length > 0) {
        UIImage *convertImage = [_imageCache objectForKey:cacheKey];
        if (convertImage == nil) {
            convertImage = [image imageAspectFillBoundingSize:boundSize cornerRadius:cornerRadius];
            [_imageCache setObject:convertImage forKey:cacheKey];
        }
        return convertImage;
    }
    else {
        UIImage *converImage = [image imageAspectFillBoundingSize:boundSize cornerRadius:cornerRadius];
        return converImage;
    }
}

#pragma mark - 异步返回图片
- (void)convertImage:(UIImage * __nonnull)image displayBoundSize:(CGSize)boundSize cornerRadius:(CGFloat)cornerRadius cacheKey:(NSString * __nullable)cacheKey completion:(CRIConvertCompletion __nullable)completion {
    dispatch_async(_imageQueue, ^{
        if (cacheKey.length > 0) {
            UIImage *convertImage = [_imageCache objectForKey:cacheKey];
            if (convertImage) {
                [self callBackMainQueue:completion image:convertImage error:nil];
            }
            else {
                convertImage = [image imageAspectFillBoundingSize:boundSize cornerRadius:cornerRadius];
                if (convertImage) {
                    [_imageCache setObject:convertImage forKey:cacheKey];
                    [self callBackMainQueue:completion image:image error:nil];
                }
                else {
                    NSError *error = [NSError errorWithDomain:@"nate.cornerRadiusImage" code:-1101 userInfo:@{@"ErrorMsg":@"convert image error"}];
                    [self callBackMainQueue:completion image:nil error:error];
                }
            }
        }
        else {
            UIImage *convertImage = [image imageAspectFillBoundingSize:boundSize cornerRadius:cornerRadius];
            if (convertImage) {
                [self callBackMainQueue:completion image:convertImage error:nil];
            }
            else {
                NSError *error = [NSError errorWithDomain:@"nate.cornerRadiusImage" code:-1101 userInfo:@{@"ErrorMsg":@"convert image error"}];
                [self callBackMainQueue:completion image:nil error:error];
            }
        }
    });
}

#pragma mark - 下载图片 异步返回
- (void)convertImageWithImageUrl:(NSURL * __nonnull)imageUrl displayBoundSize:(CGSize)boundSize cornerRadius:(CGFloat)cornerRadius completion:(CRIConvertCompletion __nullable)completion {
    
    dispatch_async(_imageQueue, ^{
        NSString *cachekey = [self cacheKeyForUrl:imageUrl];
        UIImage *cacheImage = [_imageCache objectForKey:cachekey];
        
        if (cacheImage) {
            [self callBackMainQueue:completion image:cacheImage error:nil];
            return;
        }
        
        [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:imageUrl options:SDWebImageDownloaderHighPriority progress:nil completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
            
            if (imageUrl && !error) {
                UIImage *convertImage = [image imageAspectFillBoundingSize:boundSize cornerRadius:cornerRadius];
                [_imageCache setObject:convertImage forKey:cachekey];
                [self callBackMainQueue:completion image:convertImage error:nil];
            }
            else {
                [self callBackMainQueue:completion image:nil error:error];
            }
        }];
    });
}

#pragma mark - util

- (NSString * __nonnull)cacheKeyForUrl:(NSURL * __nonnull)url {
    return [url.absoluteString copy];
}

- (void)callBackMainQueue:(CRIConvertCompletion __nonnull)completion image:(UIImage *)image error:(NSError *)error {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (completion) {
            completion(image, error);
        }
    });
}

@end
