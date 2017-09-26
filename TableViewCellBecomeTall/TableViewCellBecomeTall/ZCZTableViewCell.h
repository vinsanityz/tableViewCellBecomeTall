//
//  ZCZTableViewCell.h
//  TableViewCellBecomeTall
//
//  Created by zhaochengzhu on 2017/9/25.
//  Copyright © 2017年 vc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZCZItem;
@protocol zczprotocol <NSObject>

-(void)cellTall:(ZCZItem *)it;

@end

@interface ZCZTableViewCell : UITableViewCell
@property(weak,nonatomic)id<zczprotocol>delegate;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property(strong,nonatomic)ZCZItem * zczit;
@end
