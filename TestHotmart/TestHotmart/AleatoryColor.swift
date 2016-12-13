//
//  AleatoryColor.swift
//  TestHotmart
//
//  Created by Rodrigo A E Miyashiro on 13/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class AleatoryColor: NSObject {
    static func generate() -> String {
        let randon = Int(arc4random_uniform(5))
        var color = ""
        
        switch randon {
        case 0:
            color = Color.green.rawValue
        case 1:
            color = Color.purple.rawValue
        case 2:
            color = Color.red.rawValue
        case 3:
            color = Color.blue.rawValue
        case 4:
            color = Color.magenta.rawValue
        default:
            break
        }
        
        return color
    }
}
