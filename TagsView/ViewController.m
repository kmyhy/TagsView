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
@property (strong, nonatomic) TagsView *tagsView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tagsView = [[TagsView alloc]initWithFrame:CGRectMake(10, 100, 300, 10)];
    
//    _tagsView.showDebugBorder = YES;
    
    _tagsView.tags=@[@"睡前故事",@"热门推荐",@"经典",@"儿童教育",@"睡前故事",@"热门推荐",@"经典",@"儿童教育"];
    
    [self.view addSubview:_tagsView];
    
//    NSLog(@"%f",_container.frame.size.height);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
