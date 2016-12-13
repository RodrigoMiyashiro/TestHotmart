//
//  Message.swift
//  TestHotmart
//
//  Created by Rodrigo A E Miyashiro on 13/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import JSONJoy

struct Message: JSONJoy {
    let userLocal: People
    let userRemote: People
    let messageId: Int
    let messageDate: String
    let messageIsActive: Bool
//    let messageContents: [MessageContent]
    
    init(_ decoder: JSONDecoder) throws {
        userLocal = try People(decoder["userLocal"])
        userRemote = try People(decoder["userRemote"])
        messageId = try decoder["messageId"].get()
        messageDate = try decoder["messageDate"].get()
        messageIsActive = try decoder["messageIsActive"].get()
//        messageContents = try decoder["messagesContents"].get()
    }
}
