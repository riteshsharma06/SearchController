//
//  searchViewController.m
//  HomeDJ
//
//  Created by SoftBunch  on 10/12/16.
//  Copyright © 2016 Ram. All rights reserved.
//

#import "searchViewController.h"

@interface searchViewController ()
{
    BOOL isSearchOn;
    NSMutableArray *arrSearchedResult;
    NSMutableArray *  arrMusic;
    NSMutableArray *  arrMusicSinger;
    NSMutableArray *  arrMusicAlbum;
    NSMutableArray *arrFinal;
    
}

@end

@implementation searchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate = self;
    isSearchOn = NO;
    arrSearchedResult = [[NSMutableArray alloc] init];
    arrMusic =[[NSMutableArray alloc] initWithObjects:@"Dekha Ek Khwab-SilSila",@"Aap ki Ankhon Mein Kuch",@"Rim Jhim Gire Saawan",@"Dil Dhoondta Hai Phir Wahi Fursat Ke Raat Din",@"Is mod se jaate hai",@"Aaj se pehle aaj se ziayadha",@"Ajeeb dastan hai yeh",@"Chand Phir Nikla",@"Lootey Koi Man Ka Nagar",@"Naam Goom Jayega song",@"Dil main tujhe bitha ke",@"Isharon Isharon Mein Dil Lene Wale",@"Apni Aankhon Mein Basa Kar - Mohammad Rafi", nil];
    
    
    arrMusicSinger = [[NSMutableArray alloc] initWithObjects:@"Arijit Singh",@"Alka Yagnik",@"Bela Shende",@"Chinmayi",@"Chitra Singh",@"Kavita Subramaniam",@"Lata Mangeshkar",@"Mahalaxmi Iyer",@"Shreya Ghoshal", nil];
    
    
    arrMusicAlbum = [[NSMutableArray alloc] initWithObjects:@"In My Feelings (Goin' Thru It)",@"Wildfire",@"Blackstar",@"	Leave Me Alone",@"A War Against You",@"Keep Up",@"Joytime",@"Big World",@"Where Have You Been All My Life?",@"Malibu",@"The Casket Factory",@"Pawn Shop",@"Greatful", nil];
    // Do any additional setup after loading the view.
    
    arrFinal = [[NSMutableArray alloc] init];
    
    [arrFinal addObject:arrMusic];
    [arrFinal addObject:arrMusicSinger];
    [arrFinal addObject:arrMusicAlbum];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark tableview delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(isSearchOn)
    {
        return [arrSearchedResult count];
    }
    else
    {
        return [arrMusic count];
    }
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idSearch"];
    
    if(isSearchOn)
    {
        
        if([arrSearchedResult count] > 0)
        {
            
            cell.textLabel.text = [NSString stringWithFormat:@"%@",[arrSearchedResult objectAtIndex:indexPath.row]];
            //cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",[arrSearchedResult objectAtIndex:indexPath.row]];
        }
    }
    else
    {
        if ([arrMusic count] > 0) {
            
            cell.textLabel.text = [NSString stringWithFormat:@"%@",[arrMusic objectAtIndex:indexPath.row]];
           // cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",[arrMusic objectAtIndex:indexPath.row]];
        }
        
        
    }
    
    
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}



#pragma mark end




#pragma mark Search Event
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    if(self.searchBar.text != nil)
    {
        isSearchOn = YES;
        NSString *strText =  [self.searchBar.text lowercaseString];
        NSMutableArray *arrSearchedNames = [[NSMutableArray alloc] init];
        
      
           int i =0;
           
           for(id object in arrMusic)
           {
               NSString *removeNulls = [NSString stringWithFormat:@"%@",object];
               // NSString *stringWithoutNulls = [removeNulls stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
               if([[removeNulls lowercaseString] hasPrefix:strText])
               {
                   [arrSearchedNames addObject:object];
                   
               }
               
               i++;
           }
        for(id object in arrMusicSinger)
        {
            NSString *removeNulls = [NSString stringWithFormat:@"%@",object];
            //NSString *stringWithoutNulls = [removeNulls stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
            if([[removeNulls lowercaseString] hasPrefix:strText])
            {
                [arrSearchedNames addObject:object];
                
            }
            
            
        }
        
        for(id object in arrMusicAlbum)
        {
            NSString *removeNulls = [NSString stringWithFormat:@"%@",object];
            //NSString *stringWithoutNulls = [removeNulls stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
            if([[removeNulls lowercaseString] hasPrefix:strText])
            {
                [arrSearchedNames addObject:object];
                
            }
            
            
        }

       
        
        
        [searchBar resignFirstResponder];
        arrSearchedResult = arrSearchedNames;
        NSLog(@"searched Name %@",arrSearchedResult);
        //[self.tvFriendList reloadData];
        [self.tableSearch reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    }
    else
    {
        [searchBar resignFirstResponder];
        isSearchOn = NO;
        // [self.tvFriendList reloadData];
        [self.tableSearch reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    }
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    isSearchOn = NO;
    searchBar.text = nil;
    //[self.tvFriendList reloadData];
    [self.tableSearch reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
    isSearchOn = YES;
    //NSString *strText =  self.searchBar.text;
    NSMutableArray *arrSearchedNames = [[NSMutableArray alloc] init];
    
    int i =0;
    
    
    for(id object in arrMusic)
    {
        NSString *removeNulls = [NSString stringWithFormat:@"%@",object];
        //NSString *stringWithoutNulls = [removeNulls stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
        if([[removeNulls lowercaseString] hasPrefix:[searchText lowercaseString]])
        {
            [arrSearchedNames addObject:object];
            
        }
        
        i++;
    }
    
    for(id object in arrMusicSinger)
    {
        NSString *removeNulls = [NSString stringWithFormat:@"%@",object];
        //NSString *stringWithoutNulls = [removeNulls stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
        if([[removeNulls lowercaseString] hasPrefix:[searchText lowercaseString]])
        {
            [arrSearchedNames addObject:object];
            
        }
        
        
    }
    
    for(id object in arrMusicAlbum)
    {
        NSString *removeNulls = [NSString stringWithFormat:@"%@",object];
        //NSString *stringWithoutNulls = [removeNulls stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
        if([[removeNulls lowercaseString] hasPrefix:[searchText lowercaseString]])
        {
            [arrSearchedNames addObject:object];
            
        }
        
    
    }
    
    arrSearchedResult = arrSearchedNames;
    
    NSLog(@"searched Name %@",arrSearchedResult);
    //[self.tvFriendList reloadData];
    [self.tableSearch reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    
    
}

#pragma mark


@end
