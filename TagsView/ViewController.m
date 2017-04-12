//
//  ViewController.m
//  TagsView
//
//  Created by qq on 2017/4/11.
//  Copyright © 2017年 qq. All rights reserved.
//

#import "ViewController.h"
#import "TagsView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet TagsView *tagsView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tagsView.showDebugBorder = YES;
    
    _tagsView.tags=@[@"睡前故事",@"热门推荐",@"经典",@"儿童教育"];
    _tagsView.frame = _tagsView.intrinsicFrame;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
