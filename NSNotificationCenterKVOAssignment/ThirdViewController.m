//
//  ThirdViewController.m
//  NSNotificationCenterKVOAssignment
//
//  Created by Bennett on 2018-08-11.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (nonatomic, readonly) CGFloat oldConstraint;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardDidChange:) name:UIKeyboardDidChangeFrameNotification object:nil];
    ;
    _oldConstraint = self.bottomConstraint.constant;
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

-(void)keyboardDidChange:(NSNotification *)notification{
    NSLog(@"%@", notification.userInfo);
    NSValue *value = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect rect = value.CGRectValue;
    
    CGFloat yPos = rect.origin.y;
    CGFloat viewHeight = self.view.bounds.size.height;
    
    if (yPos == viewHeight){//restore to default
        self.bottomConstraint.constant = self.oldConstraint;
    }
    else {//move the view up using constraint
        self.bottomConstraint.constant = viewHeight - yPos;
    }

}

- (IBAction)viewTapped:(UITapGestureRecognizer *)sender {
    [self.textField resignFirstResponder];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
