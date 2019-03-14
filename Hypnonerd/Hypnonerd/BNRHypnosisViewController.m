//
//  BNRHypnosisViewController.m
//  Hypnonerd
//
//  Created by Tawhid Joarder on 3/14/19.
//  Copyright © 2019 Tawhid Joarder. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"



@interface BNRHypnosisViewController ()

@end

@implementation BNRHypnosisViewController

-(void)loadView{
    BNRHypnosisView *backgroundView = [ [BNRHypnosisView alloc] init];
    self.view = backgroundView ;
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [ super initWithNibName:nibNameOrNil bundle:nibBundleOrNil] ;
    if (self){
        self.tabBarItem.title = @"Hypnotize";
        UIImage *i = [ UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = i ;
    }
    return self ;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
