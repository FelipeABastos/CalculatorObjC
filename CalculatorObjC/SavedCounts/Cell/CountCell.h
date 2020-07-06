//
//  CountCell.h
//  CalculatorObjC
//
//  Created by Felipe Amorim Bastos on 06/07/20.
//  Copyright © 2020 Felipe Amorim Bastos. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CountCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel* lblName;
@property (nonatomic, weak) IBOutlet UILabel* lblResult;

@end

NS_ASSUME_NONNULL_END
