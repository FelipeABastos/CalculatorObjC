//
//  SavedCountsViewController.m
//  CalculatorObjC
//
//  Created by Felipe Amorim Bastos on 16/06/20.
//  Copyright © 2020 Felipe Amorim Bastos. All rights reserved.
//

#import "SavedCountsViewController.h"

@interface SavedCountsViewController ()
{
    NSMutableArray *calcs;
}
@end

@implementation SavedCountsViewController

//---------------------------------------------------------------------------------------------
//  UIViewController Delegate
//---------------------------------------------------------------------------------------------

#pragma mark - UIViewController Delegate

- (void)viewDidLoad{
    [super viewDidLoad];
    _tbCalcs.tableFooterView = [[UIView alloc]init];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self getData];
    [self.tbCalcs reloadData];
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
//  UITableView Delegate / Datasource
//---------------------------------------------------------------------------------------------

#pragma mark - UITableView Delegate / Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [calcs count];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Delete";
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"calcCell"];
    cell.textLabel.text = calcs[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
         NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
         calcs = [[userDefaults arrayForKey:@"calcs"] mutableCopy];

         if (calcs == nil){
             return;
         }
         
        [calcs removeObjectAtIndex:indexPath.row];

         [userDefaults setObject:calcs forKey:@"calcs"];
         [userDefaults synchronize];
         [tableView reloadData];
     }
}

//---------------------------------------------------------------------------------------------
//  MARK - Custom Methods
//---------------------------------------------------------------------------------------------

- (void) getData {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    calcs = [[userDefaults arrayForKey:@"calcs"] mutableCopy];
    
    if (calcs == nil) {
        calcs = [[NSMutableArray alloc] init];
    }
}

- (IBAction)backToCalculator:(id)sender {
    
    [[self presentingViewController] dismissViewControllerAnimated:true completion:false];
}

@end
