//
//  DSBarChart.m
//  DSBarChart
//
//  Created by DhilipSiva Bijju on 31/10/12.
//  Copyright (c) 2012 Tataatsu IdeaLabs. All rights reserved.
//

#import "DSBarChart.h"

@implementation DSBarChart
@synthesize color, numberOfBars, maxLen, refs, vals;

-(DSBarChart *)initWithFrame:(CGRect)frame
                       color:(UIColor *)theColor
                  references:(NSArray *)references
                   andValues:(NSArray *)values
{
    self = [super initWithFrame:frame];
    if (self) {
        self.color = theColor;
        self.vals = values;
        self.refs = references;
    }
    return self;
}

-(void)calculate{
    self.numberOfBars = (int)[self.vals count];
    for (NSNumber *val in vals) {
        float iLen = [val floatValue];
        if (iLen > self.maxLen) {
            self.maxLen = iLen;
        }
    }
}

-(UIColor *)colorFromHexString{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:self.hexStr_];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

- (void)drawRect:(CGRect)rect
{
    /// Drawing code
    [self calculate];
    float rectWidth;
    
    if (self.numberOfBars > 4)
    {
       rectWidth = (float)(rect.size.width-(self.numberOfBars)) / (float)self.numberOfBars;
    }
    else
    {
         rectWidth = 25;
    }
    //float rectWidth = (float)(rect.size.width-(self.numberOfBars)) / (float)self.numberOfBars; //somdev
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    float LBL_HEIGHT = 20.0f, iLen, x, heightRatio, height, y;
    UIColor *iColor ;
    
    /// Draw Bars
    for (int barCount = 0; barCount < self.numberOfBars; barCount++) {
        
        /// Calculate dimensions
        iLen = [[vals objectAtIndex:barCount] floatValue];
                
        x = barCount * (rectWidth);
        heightRatio = iLen / self.maxLen;
        height = heightRatio * rect.size.height;
        if (height < 0.1f) height = 1.0f;
        y = rect.size.height - height - LBL_HEIGHT;
        
        
        /*/// Reference Label. // Refrence Title
        UILabel *lblRef = [[UILabel alloc] initWithFrame:CGRectMake(barCount + x, rect.size.height - LBL_HEIGHT, rectWidth, LBL_HEIGHT)];
        lblRef.text = [refs objectAtIndex:barCount];
        lblRef.adjustsFontSizeToFitWidth = TRUE;
        lblRef.adjustsLetterSpacingToFitWidth = TRUE;
        lblRef.textColor = self.color;
        [lblRef setTextAlignment:NSTextAlignmentCenter];
        lblRef.backgroundColor = [UIColor clearColor];
        [self addSubview:lblRef];*/
        
        
        if (self.selectedPercentile == barCount)
        {
            if(self.hexStr_ != nil)
            {
                iColor = [self colorFromHexString];
            }
            else
            {
                iColor = [UIColor colorWithRed:(231/255.0) green:(231/255.0) blue:(238/255.0) alpha:1];
            }
        }
        else
        {
            iColor = [UIColor colorWithRed:(231/255.0) green:(231/255.0) blue:(238/255.0) alpha:1];
        }
        
        
        
        /// Set color and draw the bar
       // iColor = [UIColor colorWithRed:(1 - heightRatio) green:(heightRatio) blue:(0) alpha:1.0];
        CGContextSetFillColorWithColor(context, iColor.CGColor);
        CGRect barRect = CGRectMake(barCount + x, y, rectWidth, height);
        CGContextFillRect(context, barRect);
    }
    
    /// pivot
  /*  CGRect frame = CGRectZero;
    frame.origin.x = rect.origin.x;
    frame.origin.y = rect.origin.y - LBL_HEIGHT;
    frame.size.height = LBL_HEIGHT;
    frame.size.width = rect.size.width;
    UILabel *pivotLabel = [[UILabel alloc] initWithFrame:frame];
    pivotLabel.text = [NSString stringWithFormat:@"%d", (int)self.maxLen];
    pivotLabel.backgroundColor = [UIColor clearColor];
    pivotLabel.textColor = self.color;
    [self addSubview:pivotLabel];
    
    /// A line
    frame = rect;
    frame.size.height = 1.0;
    CGContextSetFillColorWithColor(context, self.color.CGColor);
    CGContextFillRect(context, frame);*/
}


@end
