//
//  HFCollectionViewController.m
//  ReactiveCocoaStoryBoardDemo
//
//  Created by Lono on 2015/8/6.
//  Copyright (c) 2015年 Hai Feng Kao. All rights reserved.
//

#import "HFCollectionViewController.h"
#import "HFCollectionViewModel.h"
#import "HFCollectionViewBindingHelper.h"
#import "HFTableViewController.h"
#import "HFCollectionViewCellModel.h"

@interface HFCollectionViewController ()
@property HFCollectionViewModel* viewModel;
@property HFCollectionViewBindingHelper* bindingHelper;
@property NSInteger cellId;
@end

@implementation HFCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    
    // Do any additional setup after loading the view.
    
    self.collectionView.pagingEnabled = YES;
    self.viewModel = [HFCollectionViewModel new];
    typeof(self) __weak selfRef = self;
    self.bindingHelper = [HFCollectionViewBindingHelper bindingForCollectionView:self.collectionView sourceList:self.viewModel.data didSelectionBlock:^(id model) {
        
        selfRef.cellId = [self.viewModel.data indexOfObject:model];
        HFCollectionViewCellModel* cellModel = model;
        [selfRef performSegueWithIdentifier:@"TableViewSegue" sender:cellModel.tableViewModel];
    } cellReuseIdentifier:@"CELL" isNested:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    NSIndexPath* path = [NSIndexPath indexPathForItem:self.cellId inSection:0];
    [self.collectionView scrollToItemAtIndexPath:path atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}

- (void)viewWillLayoutSubviews;
{
    [super viewWillLayoutSubviews];
    
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGSize itemSize = CGSizeZero;
    
    itemSize = size;
    
    UICollectionViewFlowLayout *flowLayout = (id)self.collectionView.collectionViewLayout;
    
    if (!CGSizeEqualToSize(itemSize, flowLayout.itemSize)){
        flowLayout.itemSize = itemSize;
        [flowLayout invalidateLayout]; //force the elements to get laid out again with the new size
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    id dvc = segue.destinationViewController;
    
    if ([dvc isKindOfClass:[UINavigationController class]] && ((UINavigationController *)dvc).viewControllers > 0) {
        
        dvc = [[dvc viewControllers] firstObject];
        
    }
    
    HFTableViewController* vc = dvc;
    
    vc.viewModel = sender;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete method implementation -- Return the number of sections
    return 0;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete method implementation -- Return the number of items in the section
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
