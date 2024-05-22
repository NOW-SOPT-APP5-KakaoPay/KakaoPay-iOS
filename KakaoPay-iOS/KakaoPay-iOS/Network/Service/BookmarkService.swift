//
//  BookmarkService.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/22.
//

import Foundation

import Moya

final class BookmarkService: APIService {
    static let shared = BookmarkService()
    private var bookmarkProvider = MoyaProvider<BaseAPIService>(plugins: [MoyaLoggingPlugin()])
    private override init() {}
}

extension BookmarkService {
    func postBookmarkAPI(bank: String, bankAccount: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        bookmarkProvider.request(.postBookmark(bank: bank, bankAccount: bankAccount)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeStatus(by: statusCode, data, PostBookmarkDTO.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func deleteBookmarkAPI(bank: String, bankAccount: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        bookmarkProvider.request(.deleteBookmark(bank: bank, bankAccount: bankAccount)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeStatus(by: statusCode, data, DeleteBookmarkDTO.self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
