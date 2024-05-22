//
//  GetBalanceDTO.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/22.
//

import Foundation

struct GetBalanceDTO: Codable {
    let code: Int
    let message: String
    let data: GetBalanceData
}

struct GetBalanceData: Codable {
    let balance: String
}
