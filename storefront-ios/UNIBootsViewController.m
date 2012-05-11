//
//  UNIBootsViewController.m
//  storefront-ios
//
//  Created by Feisal Adur on 5/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UNIBootsViewController.h"
#import "UNIItemViewController.h"
@implementation UNIBootsViewController



@synthesize table = _table;

-(id)init{
    self = [super init];
    if (self = [super init]) {
       }
        
    return self;

}

-(void)fetchData{

    storefront = [[Products alloc] init];
    [storefront getResource:@"http://test.unisport.dk:8000/boots/"];
    [storefront setDelegate:self];

}

-(void)processSuccessful:(BOOL)success{
    objects = [[NSMutableArray alloc] init];

    for (NSDictionary *obj in storefront.productItems) {
        productItem = [[UNIItem alloc] initWithDict:obj];
        //[objects addObject:productItem];
        [objects addObject:productItem];

    }


    [self.table reloadData];


}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self fetchData];
}

- (void)viewDidUnload
{
    [self setTableView:nil];

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


#pragma mark - Table view data source
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (objects.count != 0) {
        return objects.count;

    } else{
        return 1;
        
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 125;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
   
    if (objects.count != 0) {
        productItem = [objects objectAtIndex:[indexPath row]];
        UIImageView *image = (UIImageView *)[cell viewWithTag:101];
      
        UILabel *name = (UILabel *)[cell viewWithTag:100];
        name.text = productItem.productName;
        [image setImage: productItem.Image];
      
        
            
        NSString *lorem = [[NSString alloc] initWithString:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc mollis urna arcu. Duis quis ipsum augue. Duis erat arcu, venenatis eu tempus vehicula, imperdiet elementum nisi. Morbi ipsum leo, vulputate non tincidunt scelerisque, venenatis non odio. Morbi iaculis lobortis nulla ac porta."];
        UILabel *text = (UILabel *)[cell viewWithTag:102];
        text.text = lorem;
        UILabel *price = (UILabel *)[cell viewWithTag:103];
        NSString *pris = [productItem.productPrice substringWithRange:NSMakeRange(0, [productItem.productPrice length]-2)];
        price.text = [NSString stringWithFormat:@"Pris %@ Kr.", pris];
        
        
    }
        
    return cell;
}



#pragma mark - Table view delegate
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ShowDetail"]) {
         NSIndexPath *this = [_table indexPathForSelectedRow];
        UNIItem *item = [objects objectAtIndex:[this row]];
        [segue.destinationViewController setThisItem: item];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    
}

@end
