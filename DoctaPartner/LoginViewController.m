//
//  LoginViewController.m
//  DoctaPartner
//
//  Created by RSTI E-Services on 03/07/17.
//  Copyright © 2017 RSTI E-Services. All rights reserved.
//

#import "LoginViewController.h"
#import "SignUpViewController.h"

@interface LoginViewController ()
- (IBAction)signupbutton:(UIButton *)sender;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signupbutton:(UIButton *)sender {
    SignUpViewController *signupVC = [[SignUpViewController alloc]initWithNibName:@"SignUpViewController" bundle:nil];
    [self.navigationController pushViewController:signupVC animated:NO];
    
    
    
}
@end
