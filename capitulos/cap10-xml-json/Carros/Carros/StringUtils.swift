//
//  StringUtils.swift
//  Carros
//
//  Created by Ricardo Lecheta on 7/1/14.
//  Copyright (c) 2014 Ricardo Lecheta. All rights reserved.
//

import Foundation

class StringUtils {
    
    class func toString(_ data: Data!) -> String! {
        if(data == nil) {
            return nil
        }
        let s = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        return s! as String
    }
    
    class func toNSData(_ s: String) -> Data {
        let data = s.data(using: String.Encoding.utf8)
        return data!
    }
    
    class func toCString(_ s: String) -> UnsafePointer<Int8> {
        // cast to NSString
        // const char *
        let cstring = ("string" as NSString).utf8String
        return cstring!
    }
    
    class func trim(_ s: String) -> String {
        return s.trim()
    }
    
    class func isEmpty(_ s: String!) -> Bool {
        let count = StringUtils.count(s)
        return count == 0
    }
    
    class func count(_ s: String!) -> Int {
        if(s == nil) {
            return 0
        }
        let length = s!.count
        return length
    }
    
    class func replace(_ s: String, string: String, withString: String) -> String {
        return s.replacingOccurrences(of: string, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
}
