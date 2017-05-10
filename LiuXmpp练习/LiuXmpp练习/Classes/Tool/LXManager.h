//
//  LXManager.h
//  LiuXmpp练习
//
//  Created by 刘晓晨 on 2017/5/10.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXManager : UICollectionViewFlowLayout

+(instancetype)sharedManager;

-(void)loginWithJID:(XMPPJID *)jid andPassWord:(NSString *)passWord;

-(void)registerWithJID:(XMPPJID *)jid andPassWord:(NSString *)passWord;

@end
