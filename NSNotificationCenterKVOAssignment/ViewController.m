//
//  ViewController.m
//  NSNotificationCenterKVOAssignment
//
//  Created by Bennett on 2018-08-11.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperValueChanged:(UIStepper *)sender {
    NSNumber *stepperValue = [[NSNumber alloc] initWithDouble:sender.value];
    NSDictionary *valueDictionary = @{@"stepperValue" : [stepperValue stringValue]};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"stepperValueChanged" object:self userInfo:valueDictionary];
}

@end
