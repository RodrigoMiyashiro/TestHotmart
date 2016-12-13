//
//  MessageContent.swift
//  TestHotmart
//
//  Created by Rodrigo A E Miyashiro on 13/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import JSONJoy

struct MessageContent: JSONJoy {
    let messageId: Int
    let userId: Int
    let messageContentText: String
    let messageContentDate: String
    let messageContentWasVisualized: Bool
    
    init(_ decoder: JSONDecoder) throws {
        messageId = try decoder["messageId"].get()
        userId = try decoder["userId"].get()
        messageContentText = try decoder["messageContentText"].get()
        messageContentDate = try decoder["messageContentDate"].get()
        messageContentWasVisualized = try decoder["messageContentWasVisualized"].get()
    }
}
