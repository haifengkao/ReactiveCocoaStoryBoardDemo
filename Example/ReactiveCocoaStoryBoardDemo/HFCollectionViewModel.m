//
//  HFCollectionViewModel.m
//  ReactiveCocoaStoryBoardDemo
//
//  Created by Lono on 2015/8/6.
//  Copyright (c) 2015年 Hai Feng Kao. All rights reserved.
//

#import "HFCollectionViewModel.h"
#import "HFCollectionViewCellModel.h"
#import "HFTableViewCellModel.h"
static NSString * const ImageName = @"ImageName";
static NSString * const Detail = @"Detail";
static NSString * const Text = @"Text";

@implementation HFCollectionViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray* array = @[  @{ ImageName: @"ReactiveCocoaStoryBoardDemo.bundle/Tool1.jpg",
                             
                             Detail: @[
                                     
                                     @{Text: @"主角在追求什麼\n你要去了解創作者要表達什麼，為什麼，學會佈局觀眾的聯想",
                                       
                                       ImageName: @"ReactiveCocoaStoryBoardDemo.bundle/內頁圖片.001.jpg"
                                       
                                       },
                                     
                                     @{Text: @"說故事給別人聽\n是要讓聽眾換一個角度\n去思考我們想表達的事",
                                       
                                       ImageName: @"ReactiveCocoaStoryBoardDemo.bundle/內頁圖片.002.jpg"
                                       
                                       },
                                     
                                     @{Text: @"1+1每個格子的訊息關鍵字，加起來就是你要傳達的訊息",
                                       
                                       ImageName: @"ReactiveCocoaStoryBoardDemo.bundle/內頁圖片.003.jpg"
                                       
                                       }
                                     
                                     ]},
        
        @{ ImageName: @"ReactiveCocoaStoryBoardDemo.bundle/Tool2.jpg",
           
           Detail: @[
                   
                   @{Text: @"因為電影所有重點、佈局，是根據題目本質的重點設計的",
                     
                     ImageName: @"ReactiveCocoaStoryBoardDemo.bundle/內頁圖片.004.jpg"
                     
                     },
                   
                   @{Text: @"說故事很重要是要知道每個角色在想什麼",
                     
                     ImageName: @"ReactiveCocoaStoryBoardDemo.bundle/內頁圖片.005.jpg"
                     
                     },
                   
                   @{Text: @"未相遇兩點之間就是a...b 中間要靠想像力。",
                     
                     ImageName: @"ReactiveCocoaStoryBoardDemo.bundle/內頁圖片.006.jpg"
                     
                     }
                   
                   ]},
        
        @{ ImageName: @"ReactiveCocoaStoryBoardDemo.bundle/Tool3.jpg",
           
           Detail: @[
                   
                   @{Text: @"每一個小訊息都很重要，觀眾靠這些小訊息組合起故事發生什麼事",
                     
                     ImageName: @"ReactiveCocoaStoryBoardDemo.bundle/內頁圖片.007.jpg"
                     
                     },
                   
                   @{Text: @"希區考克非常了解\n這些情緒跟能讓觀眾一起緊張的點",
                     
                     ImageName: @"ReactiveCocoaStoryBoardDemo.bundle/內頁圖片.008.jpg"
                     
                     },
                   
                   @{Text: @"有些時候，必須強調某些細節，觀眾才會記得重點",
                     
                     ImageName: @"ReactiveCocoaStoryBoardDemo.bundle/內頁圖片.009.jpg"
                     
                     }
                   
                   ]}
        ];
        
        NSMutableArray* cellModels = [NSMutableArray new];
        for (NSDictionary* dict in array) {
            HFCollectionViewCellModel* cellModel = [HFCollectionViewCellModel new];
            cellModel.imagePath = dict[ImageName];
            
            HFTableViewModel* tableViewModel = [HFTableViewModel new];
            cellModel.tableViewModel = tableViewModel;
            
            tableViewModel.data = [KVOMutableArray new];
            
            for (NSDictionary* detail in dict[Detail]) {
                HFTableViewCellModel* tableViewCellModel = [HFTableViewCellModel new];
                tableViewCellModel.imagePath = detail[ImageName];
                tableViewCellModel.text = detail[Text];
                KVOMutableArray* innerRow = [[KVOMutableArray alloc] initWithObjects:tableViewCellModel, nil];
                [tableViewModel.data addObject:innerRow];
            }
            [cellModels addObject:cellModel];
        }
        
        self.data = [[KVOMutableArray alloc] initWithArray:cellModels];
    }
    
    return self;
}
@end
