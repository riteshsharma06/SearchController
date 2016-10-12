//
//  searchViewController.h
//  HomeDJ
//
//  Created by SoftBunch  on 10/12/16.
//  Copyright © 2016 Ram. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface searchViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableSearch;

@end
