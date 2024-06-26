//
//  HistoriesService.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/22.
//

import Foundation

import Moya

final class HistoriesService: APIService {
    static let shared = HistoriesService()
    private var historiesProvider = MoyaProvider<BaseAPIService>(plugins: [MoyaLoggingPlugin()])
    private override init() {}
}

extension HistoriesService {
    func getHistoriesAPI(completion: @escaping (NetworkResult<Any>) -> Void) {
        historiesProvider.request(.getHistories) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeStatus(by: statusCode, data, GetHistoriesDTO.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
