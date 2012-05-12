//
//  UNIItemViewController.h
//  storefront-ios
//
//  Created by Feisal Adur on 5/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UNIItem.h"
#import "UNIAsyncImage.h"
@interface UNIItemViewController : UIViewController <ImageLoaded>
{
    UNIAsyncImage *async;
}


@property (nonatomic) UNIItem *thisItem;
-(id)initWithItem:(UNIItem *)item;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end
