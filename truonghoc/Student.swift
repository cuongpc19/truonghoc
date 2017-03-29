//
//  Student.swift
//  truonghoc
//
//  Created by AgribankCard on 1/23/17.
//  Copyright © 2017 cuongpc. All rights reserved.
//




import UIKit
import os.log


class Student: NSObject, NSCoding {
    
    //MARK: Properties
    
    var name: String
    var className: String
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("students")
    
    //MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let className = "className"
    }
    
    //MARK: Initialization
    
    init?(name: String, className: String) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        // Initialize stored properties.
        self.name = name
        self.className = className
        
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(className, forKey: PropertyKey.className)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
                
        
        guard let className = aDecoder.decodeObject(forKey: PropertyKey.className) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Must call designated initializer.
        self.init(name: name, className: className)
        
    }
}
