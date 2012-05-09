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

-(void)awakeFromNib{
    [super awakeFromNib];

}
-(id)init{
    self = [super init];
    if (self = [super init]) {
        objects = [[NSMutableArray alloc] init];
       }
        
    return self;

}

-(void)fetchData{

    storefront = [[Products alloc] init];
    [storefront getResource:@"http://test.unisport.dk:8000/boots/"];
    [storefront setDelegate:self];

}

-(void)processSuccessful:(BOOL)success{
    objects = storefront.productItems;
    [_table reloadData];
    async = [[UNIAsyncImage alloc] init];
    [async setDelegate:self];


}

-(void)processImageLoaded:(BOOL)success{
    [async.imView setImage: async.img];

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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    if (objects.count != 0) {
        productItem = [[UNIItem alloc] initWithDict: [objects objectAtIndex:[indexPath row]]];
        
        UIImageView *image = (UIImageView *)[cell viewWithTag:101];
        [async ImageWithUri:productItem.productImage atThisView:image];
        UILabel *name = (UILabel *)[cell viewWithTag:100];
        name.text = productItem.productName;
        [image setImage: nil];
        
        
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
        UNIItem *item = [[UNIItem alloc] initWithDict:[objects objectAtIndex:[this row]]];
        [segue.destinationViewController setThisItem: item];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
   //[self performSegueWithIdentifier:@"ShowDetail" sender:self];
    
    //[self prepare
        
    
}

@end
