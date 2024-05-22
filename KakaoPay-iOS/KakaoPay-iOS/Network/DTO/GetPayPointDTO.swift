//
//  GetPayPointDTO.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/22.
//

import Foundation

struct GetPayPointDTO: Codable {
    let status: Int
    let message: String
    let data: GetPayPointData
}

struct GetPayPointData: Codable {
    let payPoint: String
    
    enum CodingKeys: String, CodingKey {
        case payPoint = "payPoint"
    }
}
