//
//  ForthViewController.m
//  NSNotificationCenterKVOAssignment
//
//  Created by Bennett on 2018-08-11.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "ForthViewController.h"
#import "CustomView.h"

@interface ForthViewController ()
@property (weak, nonatomic) IBOutlet CustomView *whiteView;
@property (weak, nonatomic) IBOutlet UIView *yellowView;

@end

@implementation ForthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.whiteView addObserver:self forKeyPath:@"point" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"change %@", change);
    if ([keyPath isEqualToString:@"point"]){
        id value = change[NSKeyValueChangeNewKey];
        NSLog(@"val %@", value);
        NSValue *valueCast = (NSValue *)value;
        CGPoint point = valueCast.CGPointValue;
        
        NSLog(@"point %@", NSStringFromCGPoint(point));
        
        CGFloat yellowX = self.yellowView.center.x;
        CGFloat yellowY = self.yellowView.center.y;
        
        yellowX += point.x;
        yellowY += point.y;
        
        CGPoint newCenter = CGPointMake(yellowX, yellowY);
        self.yellowView.center = newCenter;
    }
    
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

-(void)dealloc{
    [self removeObserver:self forKeyPath:@"point" context:nil];
}


@end
