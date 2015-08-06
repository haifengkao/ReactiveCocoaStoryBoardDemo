//
//  HFCollectionViewCell.h
//  ReactiveCocoaStoryBoardDemo
//
//  Created by Lono on 2015/8/6.
//  Copyright (c) 2015年 Hai Feng Kao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HFBindingViewDelegate.h"
@interface HFCollectionViewCell : UICollectionViewCell <HFBindingViewDelegate>
@property IBOutlet UIImageView* imageView;
@end
