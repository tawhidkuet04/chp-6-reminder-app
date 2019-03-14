//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Tawhid Joarder on 3/13/19.
//  Copyright © 2019 Tawhid Joarder. All rights reserved.
//

#import "BNRHypnosisView.h"
@interface BNRHypnosisView()
@property ( strong , nonatomic ) UIColor *circleColor;
@end
@implementation BNRHypnosisView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@ was touched",self);
    float red = (arc4random()%100)/100.0;
    float green = (arc4random()%100)/100.0;
    float blue = (arc4random()%100)/100.0;
    UIColor *randomColor = [ UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.circleColor = randomColor ;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [ super initWithFrame:frame];
    if(self){
        self.backgroundColor=[ UIColor clearColor];
        self.circleColor = [ UIColor lightGrayColor ];
        
    }
        return self ;
}
-(void)drawRect:(CGRect)rect{
    CGRect bounds = self.bounds;
    CGPoint center;
    center.x = bounds.origin.x+bounds.size.width/2.0;
    center.y = bounds.origin.y+bounds.size.height/2.0;
    float radius = (hypot(bounds.size.height,bounds.size.width)/2.0);
    UIBezierPath *path = [ [UIBezierPath alloc] init ];
    for ( float cr_radius = radius ; cr_radius > 0 ; cr_radius -= 20 ){
    [ path moveToPoint:CGPointMake(center.x+cr_radius, center.y)];
    [ path addArcWithCenter:center radius:cr_radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
    }
    path.lineWidth = 10 ;
    UIImage *logo = [ UIImage imageNamed:@"butterfly.png"];
  
    [ self.circleColor setStroke] ;
    [ path stroke ];
    CGRect secondFrame = CGRectMake(170,270, 100, 120);
    [logo drawInRect:secondFrame];
}

-(void)setCircleColor:(UIColor *)circleColor{
    _circleColor = circleColor ;
    [self setNeedsDisplay];
}


@end
