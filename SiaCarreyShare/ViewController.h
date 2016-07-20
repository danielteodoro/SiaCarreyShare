//
//  ViewController.h
//  SiaCarreyShare
//
//  Created by Daniel Teodoro on 19/07/16.
//  Copyright © 2016 Daniel Teodoro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface ViewController : UIViewController <UITextViewDelegate>

@property (strong, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
@property (strong, nonatomic) IBOutlet FBSDKShareButton *shareButton;
@property (strong, nonatomic) FBSDKShareLinkContent *content;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

