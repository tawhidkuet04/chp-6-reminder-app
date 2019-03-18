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



@interface BNRHypnosisViewController ()<UITextFieldDelegate>

@end

@implementation BNRHypnosisViewController

-(void)loadView{
    BNRHypnosisView *backgroundView = [ [BNRHypnosisView alloc] init];
    self.view = backgroundView ;
    CGRect textFieldRect = CGRectMake(60, 70, 240, 40);
    UITextField *textField = [ [ UITextField alloc] initWithFrame:textFieldRect ];
    textField.borderStyle = UITextBorderStyleRoundedRect ;
    [ backgroundView addSubview:textField ] ;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self ;
    
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
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //NSLog(@"%@",textField.text);
    [ self drawHypnoticMessage:textField.text];
    textField.text=@"";
    [textField resignFirstResponder];
    return YES ;
}
-(void)drawHypnoticMessage:(NSString *)message{
    for( int i = 0 ; i < 20 ; i ++ ){
        UILabel *messageLable = [ [ UILabel alloc] init ];
        messageLable.backgroundColor = [ UIColor clearColor];
        messageLable.textColor =  [UIColor blackColor ];
        messageLable.text = message ;
        [ messageLable sizeToFit ];
        int width = (int)(self.view.bounds.size.width - messageLable.bounds.size.width);
        int x = arc4random() % width ;
        int height = (int)(self.view.bounds.size.height-messageLable.bounds.size.height);
        int y = arc4random()%height;
        CGRect frame = messageLable.frame;
        frame.origin = CGPointMake(x, y);
        messageLable.frame = frame ;
        [ self.view addSubview:messageLable];
        UIInterpolatingMotionEffect *motionEffect ;
        motionEffect = [ [ UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-50);
        motionEffect.maximumRelativeValue = @(50);
        [messageLable addMotionEffect:motionEffect];
        motionEffect = [ [UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis ];
        motionEffect.minimumRelativeValue = @(-50);
        motionEffect.maximumRelativeValue = @(50);
        [messageLable addMotionEffect:motionEffect];
    }
    
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
