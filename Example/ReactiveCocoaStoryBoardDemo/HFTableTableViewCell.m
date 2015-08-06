//
//  HFTableTableViewCell.m
//  ReactiveCocoaStoryBoardDemo
//
//  Created by Lono on 2015/8/6.
//  Copyright (c) 2015年 Hai Feng Kao. All rights reserved.
//

#import "HFTableTableViewCell.h"
#import "HFTableViewCellModel.h"

@implementation HFTableTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)bindModel:(id)model
{
    HFTableViewCellModel* mod = model;
    
    self.imageView.image = [UIImage imageNamed:mod.imagePath];
    self.textLabel.text = mod.text;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
