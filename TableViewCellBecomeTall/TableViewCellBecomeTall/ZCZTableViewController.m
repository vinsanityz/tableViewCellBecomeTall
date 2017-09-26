//
//  ZCZTableViewController.m
//  TableViewCellBecomeTall
//
//  Created by zhaochengzhu on 2017/9/25.
//  Copyright © 2017年 vc. All rights reserved.
//

#import "ZCZTableViewController.h"

#import "ZCZTableViewCell.h"
#import "ZCZItem.h"
@interface ZCZTableViewController ()
@property(nonatomic,strong)NSIndexPath * ZCZindexPath;
@property(nonatomic,strong)NSMutableArray * arr;
@property(nonatomic,assign)BOOL isSelect;
@end

@implementation ZCZTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZCZItem * zcz1 = [[ZCZItem alloc]init];
    ZCZItem * zcz2 = [[ZCZItem alloc]init];
    ZCZItem * zcz3 = [[ZCZItem alloc]init];
    zcz1.str = @"我们是共产主义接班人我们是共产主义接班人我们是共产主义接班人我们是共产主义接班人我们是共产主义接班人我们是共产主义接班人我们是共产主义接班人我们是共产主义接班人我们是共产主义接班人我们是共产主义接班人我们是共产主义接班人我们是共产主义接班人我们是共产主义接班人我们是共产主义接班人";
    zcz2.str = @"222222222222222222dknfakdjnfalkdfnalkdnfalkdjfnkaldjnfklajdnfkladnfklandflkajndfalkjdfnkladnf222222222222222222dknfakdjnfalkdfnalkdnfalkdjfnkaldjnfklajdnfkladnfklandflkajndfalkjdfnkladnf";
    zcz3.str = @"33333333333333333333222222222222222222dknfakdjnfalkdfnalkdnfalkdjfnkaldjnfklajdnfkladnfklandflkajndfalkjdfnkladnf222222222222222222dknfakdjnfalkdfnalkdnfalkdjfnkaldjnfklajdnfkladnfklandflkajndfalkjdfnkladnf";
    _arr = [NSMutableArray arrayWithObjects:zcz1,zcz2,zcz3, nil];
    self.tableView.tableFooterView = [[UIView alloc]init];
   
    [self.tableView registerNib:[UINib nibWithNibName:@"ZCZTableViewCell" bundle:nil] forCellReuseIdentifier:@"zcz123"];
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZCZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"zcz123" forIndexPath:indexPath];
    cell.zczit= _arr[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.ZCZindexPath.row==indexPath.row&&self.isSelect==YES) {
     
        ZCZItem * zcz = _arr[indexPath.row];
        
        
        return zcz.cellHeight+30;
    }
    return 100;
 
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.isSelect = YES;
    self.ZCZindexPath  = indexPath;
    
    ZCZTableViewCell * zczcell = [self.tableView cellForRowAtIndexPath:indexPath];
    zczcell.contentLabel.numberOfLines = 0;
        [self.tableView reloadData];
}


@end
