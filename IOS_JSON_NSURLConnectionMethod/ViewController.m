//
//  ViewController.m
//  IOS_JSON_NSURLConnectionMethod
//
//  Created by Student P_02 on 11/06/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *urlPath=@"http://www.physics.leidenuniv.nl/json/news.php";
    NSURL *url=[NSURL URLWithString:urlPath];
    NSMutableURLRequest *reuest=[[NSMutableURLRequest alloc]initWithURL:url];
    [reuest setHTTPMethod:@"Get"];
    [NSURLConnection connectionWithRequest:reuest delegate:self];
    self.TitleArray=[[NSMutableArray alloc]init];
    self.DateArray=[[NSMutableArray alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection Failed : %@",error);
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(nonnull NSURLResponse *)response
{
    self.myData=[[NSMutableData alloc]init];
    [self.myData setLength:0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)data
{
    [self.myData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary *mainDic=[NSJSONSerialization JSONObjectWithData:self.myData options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",mainDic);
    NSArray *myArray=[mainDic valueForKey:@"newsItems"];
    for(NSDictionary *temp in myArray)
    {
        NSString *title=[temp valueForKey:@"title"];
        NSString *Date=[temp valueForKey: @"date"];
        if (title == (id)[NSNull null])
        {
            [self.TitleArray addObject:@"Nill"];
            [self.DateArray addObject:@"Nill"];
        }
            else
            {
        [self.TitleArray addObject:title];
                [self.DateArray addObject:Date];
        NSLog(@"Title=%@",title);
        NSLog(@"Title=%@",self.TitleArray);
       NSLog(@"Date=%@",self.DateArray);

            }
    }
    [self.myTableView reloadData];

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.TitleArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];

    
    cell.TitleLableCell.text=[self.TitleArray objectAtIndex:indexPath.row];
    cell.DateLableCell.text=[self.DateArray objectAtIndex:indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
