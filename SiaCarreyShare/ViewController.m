//
//  ViewController.m
//  SiaCarreyShare
//
//  Created by Daniel Teodoro on 19/07/16.
//  Copyright © 2016 Daniel Teodoro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *urlscheme = [[NSURL alloc] initWithString:@"fbauth2://"];
    [[UIApplication sharedApplication] canOpenURL:urlscheme];
    
    //login e permissões de publicação
    self.loginButton = [[FBSDKLoginButton alloc] init];
    self.loginButton.publishPermissions = @[@"publish_actions"];
    
    //imagem
    NSURL* aURL = [NSURL URLWithString:@"http://www.newnownext.com/wp-content/uploads/2014/10/Screen-Shot-2014-10-26-at-10.48.53-PM.png"];
    NSData* data = [[NSData alloc] initWithContentsOfURL:aURL];
   self.imageView.image = [UIImage imageWithData:data];
    
    //Texto
    NSString *string = [NSString stringWithString:@"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"];
    self.textView.text = string;

    //montando share
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.imageURL= aURL;
    content.quote = string;
    FBSDKShareButton *shareButton = [[FBSDKShareButton alloc] init];
    self.shareButton.shareContent = content;
//    self.shareButton.enabled = YES;
    shareButton.center = self.view.center;
    [self.view addSubview:shareButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
