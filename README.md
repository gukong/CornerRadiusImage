
##Drawing a image with corner radius. 
##Caching corner radius image. 
##Downloading a image and return a image with corner radius.
##Using SDWebImage to download image, so you should install SDwebImage by Pod

```

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

    
```

![image](https://github.com/gukong/CornerRadiusImage/blob/master/screenshot.png =400x)
