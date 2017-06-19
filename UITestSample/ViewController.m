//
//  ViewController.m
//  UITestSample
//
//  Created by Shelly Pritchard on 09/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import "ViewController.h"
#define WAIT_TIME 10.0

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.activityIndicator setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onClickLeftButton:(UIButton *)sender {
    [self.lblLeft setText:self.txtFldLeft.text];
}
- (IBAction)onClickRightButton:(UIButton *)sender {
    [self.lblRight setText:self.txtFldRight.text];
}

- (IBAction)onClickActivityIndicatorTest:(UIButton *)sender {
    [self updateTimer];
    [self.lblTestDescription setText:@"Activity Indicator disappear test"];
    [self.activityIndicator setHidden:NO];
    [self.activityIndicator startAnimating];
    [NSTimer scheduledTimerWithTimeInterval:WAIT_TIME repeats:NO block:^(NSTimer * _Nonnull timer) {
        [self.activityIndicator stopAnimating];
        [self.activityIndicator setHidden:YES];
    }];
}

- (IBAction)onClickLabelExistTest:(UIButton *)sender {
    [self updateTimer];
    [self.lblTestDescription setText:@"UILabel:'label for testing' exist Test"];
    [NSTimer scheduledTimerWithTimeInterval:WAIT_TIME repeats:NO block:^(NSTimer * _Nonnull timer) {
        [self.lblForTesting setHidden:NO];
    }];
}

- (IBAction)onClickLabelNotExistTest:(UIButton *)sender {
    [self updateTimer];
    [self.lblTestDescription setText:@"UILabel:'label for testing' not exist Test"];
    [self.lblForTesting setHidden:NO];
    [NSTimer scheduledTimerWithTimeInterval:WAIT_TIME repeats:NO block:^(NSTimer * _Nonnull timer) {
        [self.lblForTesting setHidden:YES];
    }];
}

- (IBAction)onClickButtonExistTest:(UIButton *)sender {
    [self updateTimer];
    [self.lblTestDescription setText:@"UIButton:'Button for testing' exist Test"];
    [self.btnfortesting setHidden:NO];
    [NSTimer scheduledTimerWithTimeInterval:WAIT_TIME repeats:NO block:^(NSTimer * _Nonnull timer) {
        [self.btnfortesting setHidden:YES];
    }];
}

- (IBAction)onClickButtonNotExistTest:(UIButton *)sender {
    [self updateTimer];
    [self.lblTestDescription setText:@"UIButton:'Button for testing' not exist Test"];
    [self.btnfortesting setHidden:YES];
    [NSTimer scheduledTimerWithTimeInterval:WAIT_TIME repeats:NO block:^(NSTimer * _Nonnull timer) {
        [self.btnfortesting setHidden:NO];
    }];
}

- (void)updateTimer {
    [self.lblTimer setText:[NSString stringWithFormat:@"%.2f",WAIT_TIME]];
    [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        float timeVal = [self.lblTimer.text floatValue]-1;\
        [self.lblTimer setText:[NSString stringWithFormat:@"%.2f",timeVal]];
        
    }];

}

@end
