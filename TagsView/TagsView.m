//
//  TagsView.m
//  TagsView
//
//  Created by qq on 2017/4/11.
//  Copyright © 2017年 qq. All rights reserved.
//

#import "TagsView.h"

@implementation TagsView

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self setup];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self setup];
    }
    return self;
}
-(instancetype)init{
    CGRect rect = CGRectMake(0, 0, 220, 220);
    self = [self initWithFrame:rect];
    return self;
}
-(void)setup{
    self.tags = @[@"语音通知语音",@"通知语音通知语",@"音通知语音通知",@"文字通知"];
    self.textColor = [UIColor colorWithRed:0x99/255.0 green:0x99/255.0 blue:0x99/255.0 alpha:1];
    self.borderColor = [UIColor colorWithRed:0xcc/255.0 green:0xcc/255.0 blue:0xcc/255.0 alpha:1];
    
    self.fontSize = 10;
    
    self.textInsets = UIEdgeInsetsMake(5, 6.5, 5, 6.5);
    
    self.borderInsets = UIEdgeInsetsMake(6, 6, 6, 6);
    
    self.cornerRadius = 4/[UIScreen mainScreen].scale;
    
    self.borderWidth = 1/[UIScreen mainScreen].scale;
    
    _showDebugBorder = NO;
    
    [self layoutTagFrames];
}
// MARK: - Draw work
- (void)drawRect:(CGRect)rect {
    
    for(int i=0;i<self.tags.count;i++){
        [self drawTagAtIndex:i];
        
    }
    if(_showDebugBorder){
        [self drawDebugBorder];
    }
}
-(void)drawTagAtIndex:(NSInteger)index{
    // 绘制方块
    CGRect rect = [(NSValue*)_boxFrames[index] CGRectValue];
    
    UIBezierPath* boxPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:_cornerRadius];
    
    [_borderColor setStroke];
    boxPath.lineWidth = _borderWidth;
    [boxPath stroke];
    
    // 绘制文本
    NSString* tag= _tags[index];
     NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: _fontSize], NSForegroundColorAttributeName: _textColor};
    
    CGRect textRect = CGRectInset(rect, _textInsets.left, _textInsets.top);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextClipToRect(context, textRect);
    [tag drawInRect: textRect withAttributes: textFontAttributes];
    CGContextRestoreGState(context);
    
}
-(void)drawDebugBorder{
    // 绘制调试边框
    
    UIBezierPath* boxPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, _intrinsicFrame.size.width, _intrinsicFrame.size.height) cornerRadius:_cornerRadius];
    
    [_borderColor setStroke];
    boxPath.lineWidth = _borderWidth;
    [boxPath stroke];
}
-(CGSize)tagSizeAtIndex:(NSInteger)index{
    NSString *tag = self.tags[index];
    NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
    textStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: _fontSize], NSParagraphStyleAttributeName: textStyle};
    
    CGSize textSize = [tag boundingRectWithSize: CGSizeMake(self.frame.size.width, _fontSize)  options: NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine attributes: textFontAttributes context: nil].size;
    return textSize;
}
-(CGSize)boxSizeAtIndex:(NSInteger)index{
    CGSize textSize = [self tagSizeAtIndex:index];
    return CGSizeMake(_textInsets.left+_textInsets.right+textSize.width, textSize.height+_textInsets.top+_textInsets.bottom);
}

-(void)layoutTagFrames{
    _boxFrames = [NSMutableArray new];
    // 上一个 tag 的 frame
    CGRect lastFrame = CGRectMake(0, _borderInsets.top, 0, 0);
    
    for(int i=0;i<_tags.count;i++){
        
        CGSize size=[self boxSizeAtIndex:i];
        
        CGFloat left = CGRectGetMaxX(lastFrame)+_borderInsets.left;
        
        CGFloat top = CGRectGetMinY(lastFrame);
        
        if( left+size.width > self.frame.size.width){// 长度超过，换行
        
            left = _borderInsets.left;
            top += _borderInsets.top+ CGRectGetHeight(lastFrame);
        }
        
        CGRect frame = CGRectMake(left, top, size.width, size.height);
        
        [_boxFrames addObject:[NSValue valueWithCGRect:frame]];
        
        lastFrame = frame;
    }
    
    _intrinsicFrame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), CGRectGetWidth(self.frame), CGRectGetMaxY(lastFrame)+_borderInsets.top);
}
// MARK: - Getter/setter
-(void)setTags:(NSArray<NSString *> *)tags{
    _tags = tags;
    [self layoutTagFrames];
    [self setNeedsLayout];
}
@end







