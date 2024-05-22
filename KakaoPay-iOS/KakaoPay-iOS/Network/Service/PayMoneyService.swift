//
//  PayMoneyService.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/22.
//

import Foundation

import Moya

final class PayMoneyService: APIService {
    static let shared = PayMoneyService()
    private var paymoneyProvider = MoyaProvider<BaseAPIService>(plugins: [MoyaLoggingPlugin()])
    private override init() {}
}

extension PayMoneyService {
    func getPayMoneyAPI(completion: @escaping (NetworkResult<Any>) -> Void) {
        paymoneyProvider.request(.getPayMoney) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeStatus(by: statusCode, data, GetPayMoneyDTO.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
