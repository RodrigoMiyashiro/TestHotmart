//
//  Image.swift
//  TestHotmart
//
//  Created by Rodrigo A E Miyashiro on 12/12/16.
//  Copyright © 2016 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

enum ImageName: Int {
    case dashboard
    case mySales
    case myProducts
    case affiliates
    case messages
    case notifications
    case myAccount
    case aboutThisApp
    
    static let mapper: [ImageName: String] = [
        .dashboard: "ico_dashboard",
        .mySales: "ico_minhas_vendas",
        .myProducts: "ico_meus_produtos",
        .affiliates: "ico_afiliados",
        .messages: "ico_mensagem",
        .notifications: "ico_notificacoes",
        .myAccount: "ico_minha_conta",
        .aboutThisApp: "ico_sobre_o_app"
    ]
    
    var str: String {
        return ImageName.mapper[self]!
    }
}
