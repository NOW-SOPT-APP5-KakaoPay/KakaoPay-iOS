//
//  GetHistoriesDTO.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/22.
//

import Foundation

struct GetHistoriesDTO: Codable {
    let code: Int
    let message: String
    let data: GetHistoriesData
}

struct GetHistoriesData: Codable {
    let bank: String
    let bankAccount: String
    let name: String
    let bookmark: Bool
}
