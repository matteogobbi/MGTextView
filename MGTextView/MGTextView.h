//
//  MGTextView.h
//  MGTextViewTest
//
//  Created by Matteo Gobbi on 24/01/2015.
//  Copyright (c) 2015 Matteo Gobbi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MGTextView : UITextView

@property (nonatomic, assign) BOOL autoResizableHeight;

- (void)removeExtraSpaces;

@end
