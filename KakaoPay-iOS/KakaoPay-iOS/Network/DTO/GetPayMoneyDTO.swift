//
//  GetPayMoneyDTO.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/22.
//

import Foundation

struct GetPayMoneyDTO: Codable {
    let status: Int
    let message: String
    let data: GetPayMoneyData
}

struct GetPayMoneyData: Codable {
    let payMoney: String
    
    enum CodingKeys: String, CodingKey {
        case payMoney = "payMoney"
    }
}
