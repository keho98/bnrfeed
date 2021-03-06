//
//  KHOCourseViewController.m
//  bnrfeed
//
//  Created by Kevin Ho on 2/25/15.
//  Copyright (c) 2015 kho. All rights reserved.
//

#import "KHOCourseViewController.h"

@interface KHOCourseViewController ()

@end

@implementation KHOCourseViewController

- (void)loadView
{
    UIWebView *webView = [[UIWebView alloc] init];
    webView.scalesPageToFit = YES;
    self.view = webView;
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self.view action:@selector(goBack)];
    UIBarButtonItem *fwdButton = [[UIBarButtonItem alloc] initWithTitle:@"Forward" style:UIBarButtonItemStylePlain target:self.view action:@selector(goForward)];
    [toolbar setItems:@[backButton, fwdButton]];
    
    [self.view addSubview:toolbar];
    
    NSArray *horizontalContstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[toolbar]|"
                                                                              options:0
                                                                              metrics:nil
                                                                                views:@{@"toolbar":toolbar}];
    
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[toolbar(==44)]|"
                                                                          options:0
                                                                          metrics:nil
                                                                            views:@{@"toolbar":toolbar}];
    
    [self.view addConstraints:horizontalContstraints];
    [self.view addConstraints:verticalConstraints];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setURL:(NSURL *)URL
{
    _URL = URL;
    if (_URL) {
        NSURLRequest *req = [NSURLRequest requestWithURL:_URL];
        [(UIWebView *)self.view loadRequest:req];
    }
}

#pragma mark - UISplitViewController protocol methods

- (void)splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc
{
    barButtonItem.title = @"Courses";
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

- (void)splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    if (barButtonItem == self.navigationItem.leftBarButtonItem) {
        self.navigationItem.leftBarButtonItem = nil;
    }
}

@end
