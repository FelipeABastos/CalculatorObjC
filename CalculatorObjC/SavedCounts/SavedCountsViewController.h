//
//  SavedCountsViewController.h
//  CalculatorObjC
//
//  Created by Felipe Amorim Bastos on 16/06/20.
//  Copyright © 2020 Felipe Amorim Bastos. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SavedCountsViewController : UIViewController <UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView* tbCalcs;

@end

NS_ASSUME_NONNULL_END
