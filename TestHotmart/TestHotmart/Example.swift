//
//  Example.swift
//  TestHotmart
//
//  Created by Rodrigo A E Miyashiro on 13/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import JSONJoy

// Test App
var messages: [Message] = []
var sales: [Sale] = []
var me: People!

class Example: NSObject {
    
    func loading() {
        loadingMessages()
        loadingSales()
        loadingMe()
    }
    
    // MARK: - Loading example data
    func loadingMessages() {
        let arrayMsgs = ReadingFilesJSON.readJSON(archiveName: "messages")
        do {
            let allMsgs = JSONDecoder(arrayMsgs).getOptionalArray()
            for msg in allMsgs! {
                messages.append(try Message(msg))
            }
        }
        catch {
            print("unable to parse the JSON")
        }
    }
    
    func loadingSales() {
        let arraySales = ReadingFilesJSON.readJSON(archiveName: "sales")
        do {
            let allSales = JSONDecoder(arraySales).getOptionalArray()
            for sale in allSales! {
                let newSale = try Sale(sale)
                sales.append(newSale)
            }
        }
        catch {
            print("unable to parse the JSON")
        }
    }
    
    func loadingMe() {
        let data = ReadingFilesJSON.readJSON(archiveName: "me")
        do {
            me = try People(JSONDecoder(data))
            
        }
        catch {
            print("unable to parse the JSON")
        }
    }
}
