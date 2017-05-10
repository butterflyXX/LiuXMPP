//
//  LXManager.m
//  LiuXmpp练习
//
//  Created by 刘晓晨 on 2017/5/10.
//  Copyright © 2017年 刘晓晨. All rights reserved.
//

#import "LXManager.h"
#import "XMPPLogging.h"
#import "DDLog.h"
#import "DDTTYLogger.h"


@interface LXManager ()<XMPPStreamDelegate>

@property(nonatomic,strong)XMPPStream *xmppStream;

@property(nonatomic,copy)NSString *psd;

@property(nonatomic,assign)BOOL islogin;

@end

@implementation LXManager



+(instancetype)sharedManager {
    
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    
    return instance;
}

-(void)loginWithJID:(XMPPJID *)jid andPassWord:(NSString *)passWord {
    
    self.islogin = YES;
    
    [self connectWithJID:jid andPassWord:passWord];
}

-(void)registerWithJID:(XMPPJID *)jid andPassWord:(NSString *)passWord {
    
    
    [self connectWithJID:jid andPassWord:passWord];
    
}

-(void) connectWithJID:(XMPPJID *)jid andPassWord:(NSString *)passWord {
    
    //设置ip地址,端口号,jid
    self.xmppStream.hostName = @"127.0.0.1";
    self.xmppStream.hostPort = 5222;
    self.xmppStream.myJID = jid;
    self.psd = passWord;
    //建立连接
    [self.xmppStream connectWithTimeout:-1 error:nil];
    
}

-(XMPPStream *)xmppStream {
    if (!_xmppStream) {
        _xmppStream = [XMPPStream new];
        [_xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    }
    
    return _xmppStream;
}

//-(void)logShow {
//    [DDLog addLogger:[DDTTYLogger sharedInstance] withLogLevel:xmpp_logrec]
//}

#pragma mark - XMPPStreamDelegate

//链接建立
-(void)xmppStreamDidConnect:(XMPPStream *)sender {
    NSLog(@"连接已经建立");
    
    if (self.islogin) {
        //认证密码
        [self.xmppStream authenticateWithPassword:_psd error:nil];
    } else {
        [self.xmppStream registerWithPassword:self.psd error:nil];
    }
    
    
    
}

-(void)xmppStreamDidAuthenticate:(XMPPStream *)sender {
    NSLog(@"用户登陆成功");
    
    //设置在线状态
//    XMPPPresence *presence = [[XMPPPresence alloc] initWithXMLString:@"<presence type = 'available' />" error:nil];
    
    XMPPPresence *presence = [XMPPPresence presence];
    DDXMLNode *child = [DDXMLNode elementWithName:@"show" stringValue:@"dnd"];
    DDXMLNode *child1 = [DDXMLNode elementWithName:@"status" stringValue:@"我是你爸爸"];
    
    [presence addChild:child];
    [presence addChild:child1];
    
    //send
    [self.xmppStream sendElement:presence];
}

-(void)xmppStream:(XMPPStream *)sender socketDidConnect:(GCDAsyncSocket *)socket {
    
}


@end




