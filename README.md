MGTextView
=====================

`MGTextView` extends `UITextView` fixing the Apple bugs and offering a couple of useful functionalities.

In details the 2 bugs it goes to fix are:

1. Wrong content size: when the `contentSize` change, it is reculated in the right way;
2. Wrong scroll (first line cut) when a new line is inserted.

Moreover it offers:

- Possibility to remove extra spaces like left padding and top/bottom margin (insets) often not used and useless;
- Possibility to have an auto resizable height, while the user is inserting text.

## Info

This code must be used under ARC. 
If your code doesn't use ARC you can [mark this source with the compiler flag](http://www.codeography.com/2011/10/10/making-arc-and-non-arc-play-nice.html) `-fobjc-arc` 

## Example Usage

In the package is included an example to use this class.

Quick usage:

```objective-c
MGTextView *textView = [[MGTextView alloc] initWithFrame:(CGRect){{20.f, 100.f}, {150.f, 60.f}}];
textView.delegate = self;

[self.view addSubview:textView];
```

Removing extra spaces:

```objective-c
[textView removeExtraSpaces];
```

Set a dynamic and auto resizable height:

```objective-c
textView.autoResizableHeight = YES;
```

## Contact

Matteo Gobbi

- http://www.matteogobbi.it
- http://github.com/matteogobbi
- http://twitter.com/matteo_gobbi
- https://angel.co/matteo-gobbi
- http://www.linkedin.com/profile/view?id=24211474

## License

MGTextView is available under the MIT license.
