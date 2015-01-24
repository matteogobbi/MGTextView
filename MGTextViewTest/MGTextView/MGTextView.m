//
//  MGTextView.m
//  MGTextViewTest
//
//  Created by Matteo Gobbi on 24/01/2015.
//  Copyright (c) 2015 Matteo Gobbi. All rights reserved.
//

#import "MGTextView.h"

@implementation MGTextView {
    id<UITextViewDelegate> realDelegate_;
}


#pragma mark - Inits overriding

- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder
{
    MGTextView *obj = [super awakeAfterUsingCoder:aDecoder];
    
    return obj;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (instancetype)init
{
    MGTextView *obj = [super init];
    
    return obj;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    MGTextView *obj = [super initWithCoder:aDecoder];
    
    return obj;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    MGTextView *obj = [super initWithFrame:frame];
    
    return obj;
}

- (instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer
{
    MGTextView *obj = [super initWithFrame:frame textContainer:textContainer];
    
    return obj;
}


#pragma mark - Methods overriding

- (void)setDelegate:(id<UITextViewDelegate>)delegate
{
    if (realDelegate_ != delegate) {
        realDelegate_ = delegate;
    }
}

- (id<UITextViewDelegate>)delegate
{
    return realDelegate_;
}


#pragma mark - Fixing methods

- (void)mg_scrollTextToVisible
{
    if ([self.text length] > 0) {
        [self scrollRangeToVisible:NSMakeRange(0, 1)];
    }
}


- (void)mg_adjustContentSize
{
    CGSize newContentSize = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX)
                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                 attributes:@{NSFontAttributeName: self.font}
                                                    context:nil].size;
    [self setContentSize:newContentSize];
}


#pragma mark - Other private methods


@end
