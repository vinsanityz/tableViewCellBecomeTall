//
//  ViewController.m
//  TableViewCellBecomeTall
//
//  Created by zhaochengzhu on 2017/9/25.
//  Copyright © 2017年 vc. All rights reserved.
//

#import "ViewController.h"

#import "ZCZTableViewController.h"

#import "ZCZView.h"
#import <Masonry.h>

@interface ViewController ()
@property(nonatomic,strong)ZCZTableViewController * tb;
@property(nonatomic,assign)BOOL issel;
@property(nonatomic,strong)MASConstraint * con;
@property(nonatomic,strong)UIView * redV;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    ZCZTableViewController * tb = [[ZCZTableViewController alloc] initWithStyle:UITableViewStylePlain];
//    tb.view.frame = self.view.bounds;
//    [self.view addSubview:tb.view];
//    self.tb = tb;
    
    
    UIView * redView = [[ZCZView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    self.redV =redView;
    
    
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
    
    [self.redV mas_makeConstraints:^(MASConstraintMaker *make) {
     self.con =   make.left.equalTo(self.view.mas_right).offset(0);
//        make.left.equalTo(self.view.mas_left).offset(0).priorityLow();
//         make.left.equalTo(self.view.mas_right).offset(0);make.left.equalTo(self.view.mas_left).offset(0).priorityLow();
        
        make.top.equalTo(self.view.mas_top).offset(0);
        make.width.equalTo(@100);
        make.height.equalTo(@100);
        
        
        
    }];
    //1.创建动画对象(设置layer的属性值.)
    CABasicAnimation *anim = [CABasicAnimation animation];
    //2.设置属性值
    anim.keyPath = @"position.x";
    anim.toValue = @50;
    anim.duration = 3.0;
    //动画完成时, 会自动删除动画
    anim.removedOnCompletion = NO;
    anim.fillMode = @"forwards";
    
    //3.添加动画
    [self.redV.layer addAnimation:anim forKey:nil];
    
//    [self.redV layoutIfNeeded];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.con uninstall];
        [self.redV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left);
        }];
        [self.view layoutIfNeeded];

    });
    
   
    
//    [UIView animateWithDuration:3.0 animations:^{
//       //        [self.redV mas_updateConstraints:^(MASConstraintMaker *make) {
////            make.left.equalTo(self.view.mas_left);
////        }];
//        [self.redV mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.view.mas_left).offset(0);
//        }];
//        [self.redV layoutIfNeeded];
//        
//    }];
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    [self.redV mas_makeConstraints:^(MASConstraintMaker *make) {
//       make.left.equalTo(self.view.mas_right).offset(0);
//        
//        make.top.equalTo(self.view.mas_top).offset(0);
//        make.width.equalTo(self.view.mas_width).multipliedBy(0.5);
//        make.height.equalTo(self.view.mas_height).multipliedBy(0.5);
//        
//       
//            
//        }];
//    [self.redV layoutIfNeeded];
//    [UIView animateWithDuration:10.0 animations:^{
//        
//        [self.redV mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.view.mas_left).offset(0);
//        }];
//         [self.redV layoutIfNeeded];
//        
//    }];
//    
//    
//
//
//}

@end
