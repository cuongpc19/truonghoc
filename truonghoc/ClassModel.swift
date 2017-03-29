//
//  ClassModel.swift
//  truonghoc
//
//  Created by AgribankCard on 1/23/17.
//  Copyright © 2017 cuongpc. All rights reserved.
//




import UIKit
import os.log


class ClassModel: NSObject, NSCoding {
    
    //MARK: Properties
    var name: String
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("classmodels")
    //MARK: Types
    struct PropertyKey {
        static let name = "name"
    }
    
    //MARK: Initialization
    
    init?(name: String) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }                              
        // Initialize stored properties.
        self.name = name
        
        
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
       
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        // Must call designated initializer.
        self.init(name: name)
        
    }
}
