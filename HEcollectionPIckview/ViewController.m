//
//  ViewController.m
//  HEcollectionPIckview
//
//  Created by zuo on 15/12/14.
//  Copyright © 2015年 zuo. All rights reserved.
//

#import "ViewController.h"
#import "HECollecPicker.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad{

    [super viewDidLoad];
    
    
    HECollecPicker *pickview =[[HECollecPicker alloc]init];
    pickview.frame= CGRectMake(0, 0, 200, 200);
    [self.view addSubview:pickview];
    
    
    
    
    
    
    
    
}


@end
