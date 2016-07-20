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
    
    self.textView.delegate = self;
    
    //Texto
    NSString *string = @"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s";
    self.textView.text = string;

    //montando share
    self.content = [[FBSDKShareLinkContent alloc] init];
    self.content.imageURL= aURL;
    self.content.quote = self.textView.text;
    FBSDKShareButton *shareButton = [[FBSDKShareButton alloc] init];
    self.shareButton.shareContent = self.content;
}

-(void)textViewDidChange:(UITextView *)textView{
    self.content.quote = self.textView.text;
    self.shareButton.shareContent = self.content;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){
        [textView resignFirstResponder];
    }
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
