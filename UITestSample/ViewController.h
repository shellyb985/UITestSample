//
//  ViewController.h
//  UITestSample
//
//  Created by Shelly Pritchard on 09/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnLeft;
@property (weak, nonatomic) IBOutlet UIButton *btnRight;

@property (weak, nonatomic) IBOutlet UITextField *txtFldLeft;
@property (weak, nonatomic) IBOutlet UITextField *txtFldRight;

@property (weak, nonatomic) IBOutlet UILabel *lblLeft;
@property (weak, nonatomic) IBOutlet UILabel *lblRight;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *lblForTesting;
@property (weak, nonatomic) IBOutlet UIButton *btnfortesting;

@property (weak, nonatomic) IBOutlet UILabel *lblTestDescription;
@property (weak, nonatomic) IBOutlet UILabel *lblTimer;

- (IBAction)onClickLeftButton:(UIButton *)sender;
- (IBAction)onClickRightButton:(UIButton *)sender;
- (IBAction)onClickActivityIndicatorTest:(UIButton *)sender;
- (IBAction)onClickLabelExistTest:(UIButton *)sender;
- (IBAction)onClickLabelNotExistTest:(UIButton *)sender;
- (IBAction)onClickButtonExistTest:(UIButton *)sender;
- (IBAction)onClickButtonNotExistTest:(UIButton *)sender;


@end

