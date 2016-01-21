//
//  ViewController.m
//  FastestRPM2
//
//  Created by Benson Huynh on 2016-01-21.
//  Copyright © 2016 Benson Huynh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *meterImage;
@property (weak, nonatomic) IBOutlet UIImageView *dialIMage;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panAction;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dialIMage.transform =CGAffineTransformMakeRotation(3*M_PI_4);
}

-(void)setToStartingPoint {
    self.dialIMage.transform =CGAffineTransformMakeRotation(3*M_PI_4);
}

- (IBAction)panFinger:(UIPanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateChanged ) {
    double fullCircle = 2*M_PI;
    double startPoint = (3*M_PI_4);
    double endRange = M_PI_4;
    double rangeOfSpeed = 5000;
    double speedDialRange = fullCircle - (startPoint - endRange);
    CGPoint vector = [sender velocityInView:self.view];
    double velocity = sqrt((vector.x * vector.x) + (vector.y * vector.y));
    NSLog(@"Speed is %f km/hr", velocity);
    double dialPercentage = velocity/rangeOfSpeed;
    double actualSpeed = (speedDialRange * dialPercentage) + startPoint;
    self.dialIMage.transform = CGAffineTransformMakeRotation(actualSpeed);
} else if (sender.state == UIGestureRecognizerStateEnded) {
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(setToStartingPoint) userInfo:nil repeats:YES];
}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
