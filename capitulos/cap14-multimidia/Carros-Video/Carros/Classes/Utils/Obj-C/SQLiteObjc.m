//
//  SQLiteObjc.m
//  Carros
//
//  Created by Ricardo Lecheta on 7/2/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

#import "SQLiteObjc.h"

@implementation SQLiteObjc

+ (void) bindText:(sqlite3_stmt *)stmt idx:(int)idx withString:(NSString*)s {
    sqlite3_bind_text(stmt, idx, [s UTF8String], -1, nil);
}


+ (NSString*) getText:(sqlite3_stmt *)stmt idx:(int)idx {
    char *s = (char *) sqlite3_column_text(stmt, idx);
    NSString *string = [NSString stringWithUTF8String:s];
    return string;
}



@end
