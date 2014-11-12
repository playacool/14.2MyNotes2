//
//  ViewController.m
//  14.2MyNotes2
//
//  Created by 杨冬 on 14/11/10.
//  Copyright (c) 2014年 杨冬. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NotesXMLParser *parser = [[NotesXMLParser alloc]init];
    [parser start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
