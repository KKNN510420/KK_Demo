//
//  ViewController.m
//  LX
//
//  Created by MAC on 15/12/4.
//  Copyright © 2015年 acl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    speed=320;
    im = 1;
  [NSTimer
   scheduledTimerWithTimeInterval:2 target:self selector:@selector(time) userInfo:nil repeats:YES];
    
    
    UIScrollView *image =[[UIScrollView alloc]init];
    image.frame =CGRectMake(0, 0, 320, 200);
    image.backgroundColor =[UIColor purpleColor];
    [self.view addSubview:image];
    
    image.contentSize =CGSizeMake(0, 680);
    image.contentOffset =CGPointMake(0, 0);
    image.bounces =NO;
    image.showsHorizontalScrollIndicator =NO;
    image.showsVerticalScrollIndicator =NO;
    image.pagingEnabled =NO;
    
    scrollImage =[[UIScrollView alloc]init];
    scrollImage.frame =CGRectMake(0, 0, 320, 200);
    scrollImage.showsHorizontalScrollIndicator =NO;
    scrollImage.delegate =self;
    [image addSubview:scrollImage];
    
    for (int i =0; i <6; i++) {
        imageView =[[UIImageView alloc]init];
        imageView.frame =CGRectMake(320*i, 0, 320, 200);
        imageView.image =[UIImage imageNamed:[NSString
                                              stringWithFormat:@"%d.jpg",i]];
        [scrollImage addSubview:imageView];
        
    }
    scrollImage.contentSize =CGSizeMake(320*5, 0);
    scrollImage.contentOffset =CGPointMake(0, 0);
    scrollImage.pagingEnabled =YES;
    
    page =[[UIPageControl alloc]init];
    page.frame =CGRectMake(20, 500, 280, 50);
    page.backgroundColor =[UIColor purpleColor];
    page.numberOfPages =5;
    page.currentPageIndicatorTintColor =[UIColor yellowColor];
    page.pageIndicatorTintColor =[UIColor redColor];
    page.currentPage =0;
    [page addTarget:self action:@selector(pageClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:page];
    
}

#pragma  make ---时间控制器
- (void) time {
    NSLog(@"as");
    [UIView animateWithDuration:1 animations:^{
        scrollImage.contentOffset =CGPointMake(scrollImage.contentOffset.x+speed, 0);
        
        if (scrollImage.contentOffset.x==0||scrollImage.contentOffset.x==5*320) {
            speed=-speed;
        }
        

    }];

}
#pragma mark ---页码控制器
- (void)pageClick:(UIPageControl *)pageControl{
        NSLog(@"sd132");
    scrollImage.contentOffset =CGPointMake(page.currentPage*320, 0);
   }
- (void)scrollViewDidEndDecelerating:(UIScrollView *)
scrollView {
    page.currentPage =scrollImage.contentOffset.x/320.0;
}

    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
