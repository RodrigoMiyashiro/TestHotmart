//
//  People.swift
//  TestHotmart
//
//  Created by Rodrigo A E Miyashiro on 13/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import JSONJoy

struct People: JSONJoy {
    let name: String
    let userdId: Int
    let email: String
    let photo: String
    
    init(_ decoder: JSONDecoder) throws {
        name = try decoder["userName"].get()
        userdId = try decoder["userId"].get()
        email = try decoder["userEmail"].get()
        photo = try decoder["userPhoto"].get()
    }
}
