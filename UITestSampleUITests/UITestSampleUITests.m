//
//  UITestSampleUITests.m
//  UITestSampleUITests
//
//  Created by Shelly Pritchard on 09/06/17.
//  Copyright © 2017 SPB. All rights reserved.
//

#import <XCTest/XCTest.h>
#define WAIT_TIME 30.0

@interface UITestSampleUITests : XCTestCase {
    XCUIApplication *application;
    NSPredicate *existPredicate;
    NSPredicate *notExistPredicate;

}

@end

@implementation UITestSampleUITests

- (void)setUp {
    [super setUp];
    
    self.continueAfterFailure = NO;

    application = [[XCUIApplication alloc] init];
    [application launch];
    
    existPredicate = [NSPredicate predicateWithFormat:@"exists == true"];
    notExistPredicate = [NSPredicate predicateWithFormat:@"exists == false"];

}

- (void)testViewController {
    
    XCUIElementQuery *allButtonQuery = application.buttons;
    XCUIElementQuery *allLabelQuery = application.staticTexts;
    XCUIElementQuery *allTextFldQuery = application.textFields;
    XCUIElementQuery *allTableVwQuery = application.tables;
    
    XCUIElement *leftButton = allButtonQuery[@"LeftButton"];
    XCUIElement *rightButton = allButtonQuery[@"RightButton"];
    
    XCUIElement *leftLabel = allLabelQuery[@"LeftLabel"];
    XCUIElement *rightLabel = allLabelQuery[@"RightLabel"];
    
    XCUIElement *leftTxtFld = allTextFldQuery[@"LeftTextField"];
    XCUIElement *rightTxtFld = allTextFldQuery[@"RightTextField"];
    
    
    /*
     * we can check XCUIElement exist or not: use <.exists>
     */
    if (!leftButton.exists) {
        XCTFail(@"Left button not found");
    }
    
    if (!leftLabel.exists) {
        XCTFail(@"Left label not found");
    }
    
    if (!leftTxtFld.exists) {
        XCTFail(@"Left textfield not found");
    }
    
    if (!rightButton.exists) {
        XCTFail(@"Right Button not found");
    }
    
    if (!rightLabel.exists) {
        XCTFail(@"Right label not found");
    }
    
    if (!rightTxtFld.exists) {
        XCTFail(@"Right textfield not found");
    }
}

- (void)testLeftSide {
    
    XCUIElement *leftButton = application.buttons[@"LeftButton"];
    XCUIElement *leftTxtFld = application.textFields[@"LeftTextField"];
    
    
    /*
     **TextField**
     
     *Before typing make sure it is editable
     *To make it editable use method <[TextFld tap]>
     *If TextField is not in clickable area then ur TestCase will be failed
     *You can check whether Textfield is clickable or not not by <[TextField isHittable]> method
     
     */

    if ([leftTxtFld isHittable]) {
        
        [leftTxtFld tap]; //to make it editable
        [leftTxtFld typeText:@"Hello world"]; //Typing
        
        if ([leftButton isHittable]) {
            [leftButton tap];

            XCTAssertNotNil(application.staticTexts[@"Hello world"]); //Label exist
        }
        else {
            XCTFail(@"Expected left button was not clickable");
        }
    }
    else {
        XCTFail(@"Expected Left text field was not clickable");
    }

}

- (void)testRightSide {
    
    XCUIElement *rightButton = application.buttons[@"RightButton"];
    XCUIElement *rightTxtFld = application.textFields[@"RightTextField"];
    
    
    /*
     **TextField**
     
     *Before typing make sure it is editable
     *To make it editable use method <[TextFld tap]>
     *If TextField is not in clickable area then ur TestCase will be failed
     *You can check whether Textfield is clickable or not not by <[TextField isHittable]> method
     */
    
    if ([rightTxtFld isHittable]) {
        
        [rightTxtFld tap]; //to make it editable
        [rightTxtFld typeText:@"Hello world"]; //Typing
        
        if ([rightButton isHittable]) {
            [rightButton tap];
            
            XCTAssertNotNil(application.staticTexts[@"Hello world"]); //Label exist
        }
        else {
            XCTFail(@"Expected left button was not clickable");
        }
    }
    else {
        XCTFail(@"Expected Left text field was not clickable");
    }
    
}

- (void)testActivityIndicator {
    XCUIElement *btnActivityIndicatorTest = application.buttons[@"Activity Indicator Test"];
    [btnActivityIndicatorTest tap];
    [self notExistActivityIndication:WAIT_TIME];
}

- (void)testLabelExist {
    XCUIElement *btnActivityIndicatorTest = application.buttons[@"Label Exist Test"];
    [btnActivityIndicatorTest tap];
    [self existLabel:@"label for testing" andWait:WAIT_TIME];
}

- (void)testLabelNotExist {
    XCUIElement *btnActivityIndicatorTest = application.buttons[@"Label Not Exist Test"];
    [btnActivityIndicatorTest tap];
    [self notExistLabel:@"label for testing" andWait:WAIT_TIME];
}

- (void)testButtonExist {
    XCUIElement *btnActivityIndicatorTest = application.buttons[@"Button Exist Test"];
    [btnActivityIndicatorTest tap];
    [self existButton:@"Button for testing" andWait:WAIT_TIME];
}

- (void)testButtonNotExist {
    XCUIElement *btnActivityIndicatorTest = application.buttons[@"Button  Not Exist Test"];
    [btnActivityIndicatorTest tap];
    [self notExistButton:@"Button for testing" andWait:WAIT_TIME];
}


#pragma mark- Utility Methods
#pragma mark- Exist/NotExist Label,button and Activity indication
- (void)notExistActivityIndication:(CGFloat)time {
    [self expectationForPredicate:notExistPredicate evaluatedWithObject:application.activityIndicators.element handler:nil];
    [self waitForExpectationsWithTimeout:time handler:nil];
}

- (void)existLabel:(NSString*)strLbl andWait:(CGFloat)time {
    [self expectationForPredicate:existPredicate evaluatedWithObject:application.staticTexts[strLbl] handler:nil];
    [self waitForExpectationsWithTimeout:time handler:nil];
}

- (void)existButton:(NSString*)strBtn andWait:(CGFloat)time {
    [self expectationForPredicate:existPredicate evaluatedWithObject:application.buttons[strBtn] handler:nil];
    [self waitForExpectationsWithTimeout:time handler:nil];
}

- (void)notExistLabel:(NSString*)strLbl andWait:(CGFloat)time {
    [self expectationForPredicate:notExistPredicate evaluatedWithObject:application.staticTexts[strLbl] handler:nil];
    [self waitForExpectationsWithTimeout:time handler:nil];
}

- (void)notExistButton:(NSString*)strBtn andWait:(CGFloat)time {
    [self expectationForPredicate:notExistPredicate evaluatedWithObject:application.buttons[strBtn] handler:nil];
    [self waitForExpectationsWithTimeout:time handler:nil];
}

@end
