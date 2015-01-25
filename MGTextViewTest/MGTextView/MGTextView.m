//
//  MGTextView.m
//  MGTextViewTest
//
//  Created by Matteo Gobbi on 24/01/2015.
//  Copyright (c) 2015 Matteo Gobbi. All rights reserved.
//

#import "MGTextView.h"


@interface MGTextView () <UITextViewDelegate>

@end


@implementation MGTextView {
    id<UITextViewDelegate> realDelegate_;
}


#pragma mark - Inits overriding

- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder
{
    MGTextView *obj = [super awakeAfterUsingCoder:aDecoder];
    [self mg_configure];
    return obj;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self mg_configure];
}

- (instancetype)init
{
    MGTextView *obj = [super init];
    [self mg_configure];
    return obj;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    MGTextView *obj = [super initWithCoder:aDecoder];
    [self mg_configure];
    return obj;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    MGTextView *obj = [super initWithFrame:frame];
    [self mg_configure];
    return obj;
}

- (instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer
{
    MGTextView *obj = [super initWithFrame:frame textContainer:textContainer];
    [self mg_configure];
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

- (void)mg_configure
{
    //Needed to cover the case in witch the delegate is already set (i.e. in awakeFromNib)
    
    if ([super delegate] && [super delegate] != self) {
        self.delegate = [super delegate];
    }
    
    [super setDelegate:self];
}

@end