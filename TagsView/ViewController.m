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
@property (weak, nonatomic) IBOutlet UIView *container;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tagsView = [[TagsView alloc]initWithFrame:CGRectMake(10, 10, 200, 10)];
    
    _tagsView.showDebugBorder = YES;
    
    _tagsView.tags=@[@"睡前故事",@"热门推荐",@"经典",@"儿童教育"];
    
    
    
    _container.frame = CGRectMake(10, 10, _tagsView.frame.size.width+20, _tagsView.frame.size.height+20);
    
    [_container addSubview:_tagsView];
    
    NSLog(@"%f",_container.frame.size.height);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
