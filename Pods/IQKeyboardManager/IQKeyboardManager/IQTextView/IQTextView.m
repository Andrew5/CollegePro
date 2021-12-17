//
// IQTextView.m
// https://github.com/hackiftekhar/IQKeyboardManager
// Copyright (c) 2013-16 Iftekhar Qurashi.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "IQTextView.h"

#import <UIKit/NSTextContainer.h>
#import <UIKit/UILabel.h>
#import <UIKit/UINibLoading.h>

@interface IQTextView ()

<<<<<<< HEAD
@property(nullable, nonatomic, strong) UILabel *IQ_PlaceholderLabel;
=======
@property(nonnull, nonatomic, strong) UILabel *placeholderLabel;
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28

@end

@implementation IQTextView

@synthesize placeholder = _placeholder;
<<<<<<< HEAD
@synthesize IQ_PlaceholderLabel = _IQ_PlaceholderLabel;
=======
@synthesize placeholderLabel = _placeholderLabel;
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
@synthesize placeholderTextColor = _placeholderTextColor;

-(void)initialize
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshPlaceholder) name:UITextViewTextDidChangeNotification object:self];
}

-(void)dealloc
{
<<<<<<< HEAD
    [_IQ_PlaceholderLabel removeFromSuperview];
    _IQ_PlaceholderLabel = nil;
=======
    [_placeholderLabel removeFromSuperview];
    _placeholderLabel = nil;
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self initialize];
}

-(void)refreshPlaceholder
{
    if([[self text] length] || [[self attributedText] length])
    {
<<<<<<< HEAD
        [self.IQ_PlaceholderLabel setAlpha:0];
    }
    else
    {
        [self.IQ_PlaceholderLabel setAlpha:1];
=======
        [_placeholderLabel setAlpha:0];
    }
    else
    {
        [_placeholderLabel setAlpha:1];
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
    }
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    [self refreshPlaceholder];
}

-(void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    [self refreshPlaceholder];
}

-(void)setFont:(UIFont *)font
{
    [super setFont:font];
<<<<<<< HEAD
    self.IQ_PlaceholderLabel.font = self.font;
=======
    self.placeholderLabel.font = self.font;
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

-(void)setTextAlignment:(NSTextAlignment)textAlignment
{
    [super setTextAlignment:textAlignment];
<<<<<<< HEAD
    self.IQ_PlaceholderLabel.textAlignment = textAlignment;
=======
    self.placeholderLabel.textAlignment = textAlignment;
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
<<<<<<< HEAD
    self.IQ_PlaceholderLabel.frame = [self placeholderExpectedFrame];
=======
    self.placeholderLabel.frame = [self placeholderExpectedFrame];
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
}

-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    
<<<<<<< HEAD
    self.IQ_PlaceholderLabel.text = placeholder;
=======
    self.placeholderLabel.text = placeholder;
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
    [self refreshPlaceholder];
}

-(void)setAttributedPlaceholder:(NSAttributedString *)attributedPlaceholder
{
    _attributedPlaceholder = attributedPlaceholder;
    
<<<<<<< HEAD
    self.IQ_PlaceholderLabel.attributedText = attributedPlaceholder;
=======
    self.placeholderLabel.attributedText = attributedPlaceholder;
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
    [self refreshPlaceholder];
}

-(void)setPlaceholderTextColor:(UIColor*)placeholderTextColor
{
    _placeholderTextColor = placeholderTextColor;
<<<<<<< HEAD
    self.IQ_PlaceholderLabel.textColor = placeholderTextColor;
=======
    self.placeholderLabel.textColor = placeholderTextColor;
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
}

-(UIEdgeInsets)placeholderInsets
{
    return UIEdgeInsetsMake(self.textContainerInset.top, self.textContainerInset.left + self.textContainer.lineFragmentPadding, self.textContainerInset.bottom, self.textContainerInset.right + self.textContainer.lineFragmentPadding);
}

-(CGRect)placeholderExpectedFrame
{
    UIEdgeInsets placeholderInsets = [self placeholderInsets];
    CGFloat maxWidth = CGRectGetWidth(self.frame)-placeholderInsets.left-placeholderInsets.right;
    
<<<<<<< HEAD
    CGSize expectedSize = [self.IQ_PlaceholderLabel sizeThatFits:CGSizeMake(maxWidth, CGRectGetHeight(self.frame)-placeholderInsets.top-placeholderInsets.bottom)];
=======
    CGSize expectedSize = [self.placeholderLabel sizeThatFits:CGSizeMake(maxWidth, CGRectGetHeight(self.frame)-placeholderInsets.top-placeholderInsets.bottom)];
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
    
    return CGRectMake(placeholderInsets.left, placeholderInsets.top, maxWidth, expectedSize.height);
}

<<<<<<< HEAD
-(UILabel*)IQ_PlaceholderLabel
{
    if (_IQ_PlaceholderLabel == nil)
    {
        _IQ_PlaceholderLabel = [[UILabel alloc] init];
        _IQ_PlaceholderLabel.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
        _IQ_PlaceholderLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _IQ_PlaceholderLabel.numberOfLines = 0;
        _IQ_PlaceholderLabel.font = self.font;
        _IQ_PlaceholderLabel.textAlignment = self.textAlignment;
        _IQ_PlaceholderLabel.backgroundColor = [UIColor clearColor];
        #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000
            if (@available(iOS 13.0, *)) {
                _IQ_PlaceholderLabel.textColor = [UIColor systemGrayColor];
            } else
        #endif
            {
        #if __IPHONE_OS_VERSION_MIN_REQUIRED < 130000
                _IQ_PlaceholderLabel.textColor = [UIColor lightTextColor];
        #endif
            }
        _IQ_PlaceholderLabel.alpha = 0;
        [self addSubview:_IQ_PlaceholderLabel];
    }
    
    return _IQ_PlaceholderLabel;
=======
-(UILabel*)placeholderLabel
{
    if (_placeholderLabel == nil)
    {
        _placeholderLabel = [[UILabel alloc] init];
        _placeholderLabel.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
        _placeholderLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _placeholderLabel.numberOfLines = 0;
        _placeholderLabel.font = self.font;
        _placeholderLabel.textAlignment = self.textAlignment;
        _placeholderLabel.backgroundColor = [UIColor clearColor];
        _placeholderLabel.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
        _placeholderLabel.alpha = 0;
        [self addSubview:_placeholderLabel];
    }
    
    return _placeholderLabel;
>>>>>>> f011fde2c3ac1dc4a3ea7c25fab0872df69a2c28
}

//When any text changes on textField, the delegate getter is called. At this time we refresh the textView's placeholder
-(id<UITextViewDelegate>)delegate
{
    [self refreshPlaceholder];
    return [super delegate];
}

-(CGSize)intrinsicContentSize
{
    if (self.hasText) {
        return [super intrinsicContentSize];
    }
    
    UIEdgeInsets placeholderInsets = [self placeholderInsets];
    CGSize newSize = [super intrinsicContentSize];
    
    newSize.height = [self placeholderExpectedFrame].size.height + placeholderInsets.top + placeholderInsets.bottom;
    
    return newSize;
}

@end
