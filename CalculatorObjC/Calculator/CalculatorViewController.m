//
//  CalculatorViewController.m
//  CalculatorObjC
//
//  Created by Felipe Amorim Bastos on 11/06/20.
//  Copyright © 2020 Felipe Amorim Bastos. All rights reserved.
//

typedef enum {
    Add,
    Subtract,
    Divide,
    Multiply,
    Null
}Operation;

#import "CalculatorViewController.h"
#import "SavedCountsViewController.h"

@interface CalculatorViewController ()
{
    
    NSDictionary<NSString*, NSString*> *dic;
    NSMutableArray* dicArray;
    NSString* runningNumber;
    NSString* leftValue;
    NSString* rightValue;
    NSString* result;
    Operation currentOperation;
}
@end

@implementation CalculatorViewController

//---------------------------------------------------------------------------------------------
//  UIViewController Delegate
//---------------------------------------------------------------------------------------------

#pragma mark - UIViewController Delegate

- (void)viewDidLoad{
    [super viewDidLoad];
    
    runningNumber = @"";
    self.lblCount.text = @"";
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
}

//---------------------------------------------------------------------------------------------
//  MARK - Custom Methods
//---------------------------------------------------------------------------------------------

- (IBAction)saveCount:(id)sender {
    
    SavedCountsViewController* savedVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SavesView"];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *calcs = [[userDefaults arrayForKey:@"calcs"] mutableCopy];
    
    if (calcs == nil){
        calcs = [[NSMutableArray alloc]init];
    }
    
    if ((_txtName.text == nil) || ([_txtName.text isEqualToString:@""])) {
        [calcs addObject:[NSString stringWithFormat:@"saved Calc %@", _lblCount.text]];
    }else{
        [calcs addObject:[NSString stringWithFormat:@"%@ %@", _txtName.text, _lblCount.text]];
    }
    
//    if ((_txtName.text == nil) || ([_txtName.text isEqualToString:@""])) {
//        [calcs addObject:[NSDictionary dictionaryWithObjectsAndKeys:_txtName.text, @"name", nil]];
//    }else{
//        [calcs addObject:[NSDictionary dictionaryWithObjectsAndKeys:_txtName.text, @"name", _lblCount.text, @"result", nil]];
//    }
    
    [userDefaults setObject:calcs forKey:@"calcs"];
    [userDefaults synchronize];
    
    [self presentViewController:savedVC animated:true completion:false];
}

- (IBAction)showSavedCounts:(id)sender {
    
    SavedCountsViewController* savedVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SavesView"];
    
    [self presentViewController:savedVC animated:true completion:nil];
}

- (IBAction)dividePressed:(id)sender {
    [self operation:Divide];
}

- (IBAction)multiplyPressed:(id)sender {
    [self operation:Multiply];
}

- (IBAction)subtractPressed:(id)sender {
    [self operation:Subtract];
}

- (IBAction)addPressed:(id)sender {
    [self operation:Add];
}

- (IBAction)equalPressed:(id)sender {
    [self operation:currentOperation];
}

- (IBAction)allClearPressed:(id)sender {
    
    runningNumber = @"";
    leftValue = @"";
    rightValue = @"";
    result = @"";
    currentOperation = Null;
    self.lblCount.text = @"0";
}

- (IBAction)numberPressed:(id)sender {
    
    if ([runningNumber length] <= 8) {
        NSInteger number = [sender tag];
        NSString *numberString = [NSString stringWithFormat:@"%ld", (long)number];
        runningNumber = [runningNumber stringByAppendingString:numberString];
        self.lblCount.text = runningNumber;
    }
}

- (IBAction)dotPressed:(id)sender {
    
    if ([runningNumber length] <= 7) {
        runningNumber = [runningNumber stringByAppendingString:@"."];
    }
}

- (void)operation:(Operation)operation {
    
    if (currentOperation != Null) {
        
        if (![runningNumber  isEqual: @""]) {
            
            rightValue = runningNumber;
            runningNumber = @"";
            
            if (currentOperation == Add) {
                double finalResult = [leftValue doubleValue] + [rightValue doubleValue];
                result = [NSString stringWithFormat:@"%.1f", finalResult];
            }else if (currentOperation == Subtract) {
                double finalResult = [leftValue doubleValue] - [rightValue doubleValue];
                result = [NSString stringWithFormat:@"%.1f", finalResult];
            }else if (currentOperation == Multiply) {
                double finalResult = [leftValue doubleValue] * [rightValue doubleValue];
                result = [NSString stringWithFormat:@"%.1f", finalResult];
            }else if (currentOperation == Divide) {
                double finalResult = [leftValue doubleValue] / [rightValue doubleValue];
                result = [NSString stringWithFormat:@"%.1f", finalResult];
            }

            leftValue = result;
            if (trunc([result doubleValue]) == 0) {
                
                double doubleResult = [result doubleValue];
                int intResult = (int)doubleResult;
                result = [NSString stringWithFormat:@"%d", intResult];
            }
            
            _lblCount.text = result;
        }
        currentOperation = operation;
    }else{
        leftValue = runningNumber;
        runningNumber = @"";
        currentOperation = operation;
    }
}

@end
