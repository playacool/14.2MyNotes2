//
//  NotesXMLParser.h
//  14.2MyNotes2
//
//  Created by 杨冬 on 14/11/10.
//  Copyright (c) 2014年 杨冬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotesXMLParser : NSObject<NSXMLParserDelegate>
//用于解析出来的数据，内部是字典型
@property (nonatomic, strong) NSMutableArray *notes;
//当前标签的名字
@property (nonatomic, strong) NSString *currentTagName;
//开始解析
- (void)start;
@end
