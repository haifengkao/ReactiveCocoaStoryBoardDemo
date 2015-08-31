//
//  HFTableViewController.m
//  ReactiveCocoaStoryBoardDemo
//
//  Created by Lono on 2015/8/6.
//  Copyright (c) 2015年 Hai Feng Kao. All rights reserved.
//

#import "HFTableViewController.h"
#import "HFTableViewBindingHelper.h"
@interface HFTableViewController ()
@property HFTableViewBindingHelper* bindingHelper;
@property IBOutlet UIBarButtonItem* backItem;
@end

#define FooterSize 6.0
#define SeperatorInset 15.0
@implementation HFTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.bindingHelper = [HFTableViewBindingHelper bindingForTableView:self.tableView sourceList:self.viewModel.data didSelectionBlock:^(id model) {
        
    } cellReuseIdentifier:@"CELL" isNested:YES];
    
    self.tableView.sectionFooterHeight = FooterSize;
    self.tableView.sectionHeaderHeight = 5.0;
    self.tableView.allowsSelection = NO;
    self.backItem.action = @selector(back:);
    self.backItem.target = self;
    
    UIView* backgroundView = [[UIView alloc] initWithFrame:self.tableView.bounds];
    
    backgroundView.backgroundColor = [UIColor colorWithWhite:60.0/255.0 alpha:1.0];
    [self.tableView setBackgroundView:backgroundView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillLayoutSubviews;

{
    [super viewWillLayoutSubviews];
    
    
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGFloat width = size.width;
    
    // Golden ration 2:1 in width
    
    CGFloat rowHeight = round(width*8.0/12.0/2.0);
    
//    if (UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication.statusBarOrientation)) {
    
    if (self.tableView.rowHeight != rowHeight) {
        
        self.tableView.rowHeight = rowHeight;
        
        [self.tableView reloadData];
        
    }
    
}

#pragma mark - Table view data source

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.tableView.bounds), 5.0);
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footerView = [[UIView alloc] init];
    
    if (section != self.tableView.numberOfSections-1) {
        UIView* line = [[UIView alloc] init];
        
        line.backgroundColor = [UIColor whiteColor];
        
        footerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.tableView.bounds), FooterSize);
        
        CGRect frame = CGRectZero;
        frame.origin.x = SeperatorInset;
        frame.origin.y = FooterSize - 1;
        
        frame.size = CGSizeMake(footerView.frame.size.width - 2*SeperatorInset, 1.0);
        line.frame = frame;
        
        [footerView addSubview:line];
    }
    
    return footerView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - UITableViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    [self centerTable];
    
}



- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    
    [self centerTable];
    
}



- (void)centerTable {
    
    NSIndexPath *pathForCenterCell = [self.tableView indexPathForRowAtPoint:CGPointMake(CGRectGetMidX(self.tableView.bounds), CGRectGetMidY(self.tableView.bounds))];
    
    
    
    [self.tableView scrollToRowAtIndexPath:pathForCenterCell atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    
}
@end
