//
//  ZCZTableViewCell.m
//  TableViewCellBecomeTall
//
//  Created by zhaochengzhu on 2017/9/25.
//  Copyright © 2017年 vc. All rights reserved.
//

#import "ZCZTableViewCell.h"
#import "ZCZItem.h"


@implementation ZCZTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
//    self.contentLabel.contentMode = UIViewContentModeTopLeft;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setZczit:(ZCZItem *)zczit
{
    _zczit = zczit;
    
    NSLog(@"%p---%p",&_zczit,&zczit);
    self.contentLabel.text = zczit.str;
    
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:zczit.str];
    NSRange range = NSMakeRange(0, attrStr.length);
    NSDictionary *dic = [attrStr attributesAtIndex:0 effectiveRange:&range];
    CGSize sizeToFit = [zczit.str boundingRectWithSize:CGSizeMake(self.frame.size.width-29, MAXFLOAT) options:NSStringDrawingUsesDeviceMetrics  attributes:dic  context:nil].size;
    // context上下文。包括一些信息，例如如何调整字间距以及缩放。该对象包含的信息将用于文本绘制。该参数可为nil
//    NSLog(@"%@",NSStringFromCGSize(sizeToFit));
    _zczit.cellHeight = sizeToFit.height +self.contentLabel.frame.origin.y + 7.5;
//    NSLog(@"%p",&zczit);
    NSLog(@"%f",sizeToFit.height);
    
}
- (IBAction)btnclick:(id)sender {
    if (self.delegate&&[self.delegate respondsToSelector:@selector(cellTall:)]) {
        [self.delegate cellTall:_zczit];
        
    }

}

@end
