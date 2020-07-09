//
//  ViewController.m
//  Parse Lab
//
//  Created by Ian Andre Aragon Saenz on 06/07/20.
//  Copyright © 2020 IanAragon. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)doSignUp:(id)sender {
    PFUser *user = [PFUser user];
    
    user.username = self.username.text;
    user.password = self.password.text;
    
    if([self.username.text isEqualToString:@""]){
        UIAlertController *alert= [UIAlertController alertControllerWithTitle:@"Error" message:@"Username empty" preferredStyle:(UIAlertControllerStyleAlert)];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:ok];
        
        return;
    }
    
    if([self.password.text isEqualToString:@""]){
        UIAlertController *alert= [UIAlertController alertControllerWithTitle:@"Error" message:@"Password empty" preferredStyle:(UIAlertControllerStyleAlert)];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:ok];
        
        return;
    }
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if(error != nil){
            NSLog(@"error creating user: %@", error.localizedDescription);
        }else{
            NSLog(@"user created");
            [self performSegueWithIdentifier:@"LoginSegue" sender:nil];
        }
    }];
    
}

- (IBAction)doLogin:(id)sender {
    NSString *username = self.username.text;
    NSString *password = self.password.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * _Nullable user, NSError * _Nullable error) {
        if(error != nil){
            NSLog(@"error creating user: %@", error.localizedDescription);
            
            UIAlertController *alert= [UIAlertController alertControllerWithTitle:@"Error" message:error.localizedDescription preferredStyle:(UIAlertControllerStyleAlert)];
            
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            }];
            [alert addAction:ok];
        }else{
            NSLog(@"user succesfully loged in");
            [self performSegueWithIdentifier:@"LoginSegue" sender:nil];
        }
    }];
}

@end
