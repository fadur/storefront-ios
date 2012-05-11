//
//  UNIItem.h
//  Unisport-iOs
//
//  Created by Feisal Adur on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UNIItem : NSObject
{
    NSString *productId;
    NSString *productName;
    NSString *productPrice;
    NSString *expectedDelivery;
    NSArray *availableSizes;
    UIImage *img;
  
    NSURL *imgUrl;
}

@property (nonatomic, copy) NSString *productId;
@property (nonatomic, copy) NSString *productName;
@property (nonatomic, copy) NSString *productDescription;
@property (nonatomic, copy) NSString *productPrice;
@property (nonatomic, copy) NSString *expectedDelivery;
@property (nonatomic, copy) NSArray *availableSizes;
@property (nonatomic, copy) UIImage *Image;

-(id)initWithDict:(NSDictionary *)obj;
-(void)productImage;



@end
