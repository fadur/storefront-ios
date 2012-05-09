//
//  UNIItemViewController.h
//  storefront-ios
//
//  Created by Feisal Adur on 5/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UNIItem.h"
@interface UNIItemViewController : UIViewController
{
}


@property (nonatomic) UNIItem *thisItem;
-(id)initWithItem:(UNIItem *)item;

@end
