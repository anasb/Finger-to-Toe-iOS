//
//  SignupViewController.m
//  Finger To Toe
//
//  Created by Anas Bouzoubaa on 29/11/15.
//  Copyright © 2015 Small Data Lab. All rights reserved.
//

#import "SignupViewController.h"
#import <SingleLineInput/SingleLineTextField.h>

@interface SignupViewController ()

@property (strong, nonatomic) IBOutlet SingleLineTextField *nameTextField;
@property (strong, nonatomic) IBOutlet SingleLineTextField *ageTextField;
@property (strong, nonatomic) IBOutlet SingleLineTextField *heightTextField;
@property (strong, nonatomic) IBOutlet SingleLineTextField *conditionsTextField;

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (IBAction)pressedSignup:(id)sender
{
    if (self.nameTextField.text.length == 0) {
        [self.nameTextField becomeFirstResponder];
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:self.nameTextField.text forKey:@"username"];
    [[NSUserDefaults standardUserDefaults] setObject:self.ageTextField.text forKey:@"age"];
    [[NSUserDefaults standardUserDefaults] setObject:self.heightTextField.text forKey:@"height"];
    [[NSUserDefaults standardUserDefaults] setObject:self.conditionsTextField.text forKey:@"conditions"];
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"USER_HAS_SIGNED_UP"];
    
    [[[[UIApplication sharedApplication] windows] objectAtIndex:0] setRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"cameraViewController"]];
}

@end
