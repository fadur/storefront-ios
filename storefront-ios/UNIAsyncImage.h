//
//  UNIAsyncImage.h
//  storefront-ios
//
//  Created by Feisal Adur on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol ImageLoaded <NSObject>

@required 
-(void)processImageLoaded:(BOOL)success;
@end

@interface UNIAsyncImage : NSObject


{
    id <ImageLoaded> delegate;
    NSURLConnection *connect;

}

@property (strong, nonatomic) id delegate;
@property (weak, nonatomic) UIImage *img;
@property (weak, nonatomic) UIImageView *imView;
-(void)ImageWithUri:(NSURL *)uri atThisView:(UIImageView *)imgView;




@end
