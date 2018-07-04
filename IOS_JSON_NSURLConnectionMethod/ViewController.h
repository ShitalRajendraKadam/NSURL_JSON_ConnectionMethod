//
//  ViewController.h
//  IOS_JSON_NSURLConnectionMethod
//
//  Created by Student P_02 on 11/06/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
@interface ViewController : UIViewController<NSURLConnectionDelegate,NSURLConnectionDataDelegate,UITableViewDelegate,UITableViewDataSource>
@property NSMutableData *myData;
@property NSMutableArray *myArray;
@property NSMutableArray *TitleArray;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property NSMutableArray *DateArray;
@end

