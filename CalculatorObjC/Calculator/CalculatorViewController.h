//
//  CalculatorViewController.h
//  CalculatorObjC
//
//  Created by Felipe Amorim Bastos on 11/06/20.
//  Copyright © 2020 Felipe Amorim Bastos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel* lblCount;
@property (nonatomic, weak) IBOutlet UIButton* btnAdd;
@property (nonatomic, weak) IBOutlet UIButton* btnSubtract;
@property (nonatomic, weak) IBOutlet UIButton* btnDivide;
@property (nonatomic, weak) IBOutlet UIButton* btnMultiply;
@property (nonatomic, weak) IBOutlet UITextField* txtName;

@end

