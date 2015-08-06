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
    self.bindingHelper = [HFCollectionViewBindingHelper bindingForCollectionView:self.collectionView sourceList:self.viewModel.data didSelectionBlock:^(id model) {
        
        HFCollectionViewCellModel* celModel = model;
        [self performSegueWithIdentifier:@"TableViewSegue" sender:celModel.tableViewModel];
    } cellReuseIdentifier:@"CELL" isNested:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews;
{
    [super viewWillLayoutSubviews];
    
    CGSize itemSize = CGSizeZero;
    
    if (UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication.statusBarOrientation)) {
        itemSize = CGSizeMake(568.0, 300.0);
    } else {
        itemSize = CGSizeMake(320.0, 548.0);
    }
    //    if (UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication.statusBarOrientation)) {
    //        itemSize = CGSizeMake(1024.0, 748.0);
    //    } else {
    //        itemSize = CGSizeMake(768.0, 1004.0);
    //    }
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
