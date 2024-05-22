//
//  BaseAPIService.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/22.
//

import Foundation
import Moya

enum BaseAPIService {
    case getBalance
    case getPayPoint
    case postBookmark(bank: String, bankAccount: String)
    case getHistories
    case getPayMoney
    case deleteBookmark(bank: String, bankAccount: String)
}

extension BaseAPIService: TargetType {
    
    
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getBalance:
            return "api/v1/member/balance"
        case .getPayPoint:
            return "api/v1/member/paypoint"
        case .postBookmark(bank: let bank, bankAccount: let bankAccount):
            return "api/v1/bookmark"
        case .getHistories:
            return "api/v1/history"
        case .getPayMoney:
            return "api/v1/member/paymoney"
        case .deleteBookmark(bank: let bank, bankAccount: let bankAccount):
            return "api/v1/bookmark"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getBalance, .getPayPoint, .getHistories, .getPayMoney:
            return .get
        case .postBookmark:
            return .post
        case .deleteBookmark:
            return .delete
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getBalance:
            return .requestPlain
        case .getPayPoint:
            return .requestPlain
        case .postBookmark(bank: let bank, bankAccount: let bankAccount):
            return .requestJSONEncodable(PostBookmarkDTO(bank: bank, bankAccount: bankAccount))
        case .getHistories:
            return .requestPlain
        case .getPayMoney:
            return .requestPlain
        case .deleteBookmark(bank: let bank, bankAccount: let bankAccount):
            return .requestJSONEncodable(DeleteBookmarkDTO(bank: bank, bankAccount: bankAccount))
        }
    }
    
    var headers: [String : String]? {
        return ["memberId": "1"]
    }
}
