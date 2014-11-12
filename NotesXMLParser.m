//
//  NotesXMLParser.m
//  14.2MyNotes2
//
//  Created by 杨冬 on 14/11/10.
//  Copyright (c) 2014年 杨冬. All rights reserved.
//

#import "NotesXMLParser.h"

@implementation NotesXMLParser

- (void)start{
    NSString *path = [[NSBundle mainBundle] pathForResource: @"Notes" ofType: @"xml"];
    NSURL *url = [NSURL fileURLWithPath: path];
    
    //开始解析
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL: url];
    parser.delegate = self;
    [parser parse];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser{
    self.notes = [NSMutableArray array];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    self.currentTagName = elementName;
    if ([self.currentTagName isEqualToString: @"Note"]) {
        NSString *_id = [attributeDict objectForKey: @"id"];
        NSMutableDictionary *dict = [NSMutableDictionary new];
        [dict setObject: _id forKey: @"id"];
        [self.notes addObject: dict];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    string = [string stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([string isEqualToString: @""]) {
        return;
    }
    
    NSMutableDictionary *dict = [self.notes lastObject];
    if ( [self.currentTagName isEqualToString: @"CDate"] && dict) {
        [dict setObject: string forKey: @"CDate"];
    }
    
    if ( [self.currentTagName isEqualToString: @"Content"] && dict) {
        [dict setObject: string forKey: @"Content"];
    }
    
    if ( [self.currentTagName isEqualToString: @"UserID"] && dict) {
        [dict setObject: string forKey: @"UserID"];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    self.currentTagName = nil;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    [[NSNotificationCenter defaultCenter] postNotificationName: @"reloadViewNotification" object: self.notes];
    self.notes = nil;
}

@end
