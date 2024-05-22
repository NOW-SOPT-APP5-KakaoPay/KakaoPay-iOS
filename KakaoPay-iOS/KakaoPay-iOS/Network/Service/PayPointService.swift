//
//  PayPointService.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/22.
//

import Foundation

import Moya

final class PayPointService: APIService {
    static let shared = PayPointService()
    private var paypointProvider = MoyaProvider<BaseAPIService>(plugins: [MoyaLoggingPlugin()])
    private override init() {}
}

extension PayPointService {
    func getPayPointAPI(completion: @escaping (NetworkResult<Any>) -> Void) {
        paypointProvider.request(.getPayPoint) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeStatus(by: statusCode, data, GetPayPointDTO.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
