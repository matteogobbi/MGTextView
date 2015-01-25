//
//  MGTextView.m
//  MGTextViewTest
//
//  Created by Matteo Gobbi on 24/01/2015.
//  Copyright (c) 2015 Matteo Gobbi. All rights reserved.
//

#import "MGTextView.h"

#define DEFAULT_FONT [UIFont systemFontOfSize:14.0]


@interface MGTextView () <UITextViewDelegate>

@end


@implementation MGTextView


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


#pragma mark - Other method

- (void)dealloc
{
    [self removeObserver:self forKeyPath:NSStringFromSelector(@selector(contentSize))];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(contentSize))]) {

        if ([self mg_adjustContentSize]) {
            [self mg_scrollTextToVisible];
            
            if (self.autoResizableHeight) {
                [self mg_autoResizeHeight];
            }
        }
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


#pragma mark - Fixing methods

- (void)mg_scrollTextToVisible
{
    if ([self.text length] > 0) {
        [self scrollRangeToVisible:NSMakeRange(0, 1)];
    }
}


- (BOOL)mg_adjustContentSize
{
    if (!self.font) {
        self.font = DEFAULT_FONT;
        return NO;
    }
    
    CGSize newContentSize = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX)
                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                 attributes:@{NSFontAttributeName: self.font}
                                                    context:nil].size;
    
    newContentSize.height += (self.textContainerInset.top + self.textContainerInset.bottom);
    
    if ([self mg_hasContentSizeEqualTo:newContentSize]) {
        return NO;
    }
    
    [self setContentSize:newContentSize];
    
    return YES;
}


#pragma mark - Other private methods

- (void)mg_configure
{
    self.autoResizableHeight = NO;
    
    [self addObserver:self forKeyPath:NSStringFromSelector(@selector(contentSize)) options:NSKeyValueObservingOptionNew context:nil];
}

- (void)mg_autoResizeHeight
{
    CGRect rect = self.frame;
    rect.size.height = self.contentSize.height;
    
    self.frame = rect;
}


#pragma mark - Helper methods

- (BOOL)mg_hasContentSizeEqualTo:(CGSize)size
{
    return self.contentSize.height == size.height && self.contentSize.width == size.width;
}


#pragma mark - Overriding methods

- (void)setFont:(UIFont *)font
{
    if ([self.font isEqual:font]) {
        return;
    }
    
    [super setFont:font];
    
    [self mg_adjustContentSize];
}


#pragma mark - Public methods

- (void)removeExtraSpaces
{
    self.textContainer.lineFragmentPadding = 0;
    self.textContainerInset = UIEdgeInsetsZero;
}


@end
