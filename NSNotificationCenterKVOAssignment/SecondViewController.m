//
//  SecondViewController.m
//  NSNotificationCenterKVOAssignment
//
//  Created by Bennett on 2018-08-11.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (nonatomic, assign)NSNumber *numberValue;

@end

@implementation SecondViewController

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (! (self = [super initWithCoder:aDecoder]))
        return nil;
    
    // object has been created from IB... do initialization stuff here
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateLabelValue:) name:@"stepperValueChanged" object:nil];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void)viewWillAppear:(BOOL)animated
{
        self.numberLabel.text = [self.numberValue stringValue];
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

-(void)updateLabelValue:(NSNotification*)notification{
    NSDictionary *userinfo = notification.userInfo;
    
    if (userinfo[@"stepperValue"])
    {
        self.numberValue = userinfo[@"stepperValue"];
        
        if (self.numberLabel)
            self.numberLabel.text = [self.numberValue stringValue];
    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}

@end
