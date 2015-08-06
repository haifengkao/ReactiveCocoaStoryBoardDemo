//
//  HFCollectionViewCell.m
//  ReactiveCocoaStoryBoardDemo
//
//  Created by Lono on 2015/8/6.
//  Copyright (c) 2015年 Hai Feng Kao. All rights reserved.
//

#import "HFCollectionViewCell.h"
#import "HFCollectionViewCellModel.h"

@implementation HFCollectionViewCell

- (void)bindModel:(id)model
{
    HFCollectionViewCellModel* mod = model;
    self.imageView.image = [UIImage imageNamed:mod.imagePath];
}

@end
