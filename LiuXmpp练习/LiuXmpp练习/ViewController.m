//
//  ViewController.m
//  LiuXmpp练习
//
//  Created by 刘晓晨 on 2017/5/8.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [[LXManager sharedManager] loginWithJID:[XMPPJID jidWithUser:@"lisi" domain:@"xiaobeidediannao.local" resource:@"iOS"] andPassWord:@"123"];
    
    [[LXManager sharedManager] registerWithJID:[XMPPJID jidWithUser:@"xiaoming" domain:@"xiaobeidediannao.local" resource:@"iOS"] andPassWord:@"123"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
