//
//  TagsView.h
//  TagsView
//
//  Created by qq on 2017/4/11.
//  Copyright © 2017年 qq. All rights reserved.
//

#import <UIKit/UIKit.h>


IB_DESIGNABLE
@interface TagsView : UIView{
    UILabel* titleLabel ;
}

/// title 相关
@property(copy,nonatomic)NSString* title;
@property(assign,nonatomic)UIEdgeInsets titleInsets;
@property(strong,nonatomic)UIColor* titleColor;

/// tags 相关
@property(strong,nonatomic)NSArray<NSString*> *tags;
@property(strong,nonatomic)IBInspectable UIColor* textColor;
@property(assign,nonatomic)IBInspectable CGFloat fontSize;
@property(assign,nonatomic)IBInspectable CGFloat cornerRadius;
@property(strong,nonatomic)IBInspectable UIColor* borderColor;
@property(assign,nonatomic)IBInspectable CGFloat borderWidth;
@property(assign,nonatomic)UIEdgeInsets textInsets;
@property(assign,nonatomic)UIEdgeInsets borderInsets;

@property(strong,nonatomic,readonly)NSMutableArray* boxFrames;
@property(assign,nonatomic,readonly)CGRect intrinsicFrame;
@property(assign,nonatomic)IBInspectable BOOL showDebugBorder;
@end
