//
//  Sale.swift
//  TestHotmart
//
//  Created by Rodrigo A E Miyashiro on 13/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import JSONJoy

struct Sale: JSONJoy {
    let saleId: Int
    let saleDate: String
    let salePrice: String
    let saleDescription: String
    
    init(_ decoder: JSONDecoder) throws {
        saleId = try decoder["saleId"].get()
        saleDate = try decoder["saleDate"].get()
        salePrice = try decoder["salePrice"].get()
        saleDescription = try decoder["saleDescritpion"].get()
    }
}
