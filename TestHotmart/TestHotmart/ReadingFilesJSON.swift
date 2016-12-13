//
//  ReadingFilesJSON.swift
//  TestHotmart
//
//  Created by Rodrigo A E Miyashiro on 13/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class ReadingFilesJSON: NSObject {
        
    static func readJSON (archiveName: String) -> NSData {
        var data = NSData()
        let path = Bundle.main.path(forResource: archiveName, ofType: "json")
        
        do {
            data = try NSData(contentsOfFile: path!, options: [])
        }
        catch {print("Error...")}
        
        return data
    }
}
