//
//  ViewController.m
//  Search
//
//  Created by Jobs on 2020/7/31.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "ViewController.h"
#import "SearchVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kRedColor;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event{
    @weakify(self)
    [SearchVC ComingFromVC:weak_self
               comingStyle:ComingStyle_PUSH
         presentationStyle:UIModalPresentationAutomatic
             requestParams:nil
                   success:^(id data) {}
                  animated:YES];
}


@end
