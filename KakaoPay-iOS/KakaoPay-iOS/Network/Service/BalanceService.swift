//
//  BalanceService.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/22.
//

import Foundation

import Moya

final class BalanceService: APIService {
    static let shared = BalanceService()
    private var balanceProvider = MoyaProvider<BaseAPIService>(plugins: [MoyaLoggingPlugin()])
    private override init() {}
}

extension BalanceService {
    func getBalanceAPI(completion: @escaping (NetworkResult<Any>) -> Void) {
        balanceProvider.request(.getBalance) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeStatus(by: statusCode, data, GetBalanceDTO.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
