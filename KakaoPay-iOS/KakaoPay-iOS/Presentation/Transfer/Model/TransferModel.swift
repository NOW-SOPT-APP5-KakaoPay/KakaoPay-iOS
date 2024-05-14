//
//  TransferModel.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/13.
//


struct TransferModel {
    let bank: String
    let bankAccount: String
    let name: String
    let bookmark: Bool
}

extension TransferModel {
    static func dummy() -> [TransferModel] {
        return [
        TransferModel(bank: "신한", bankAccount: "1111-1111-1111", name: "김가현", bookmark: false),
        TransferModel(bank: "토스", bankAccount: "2222-2222-2222", name: "조혜린", bookmark: false),
        TransferModel(bank: "카카오", bankAccount: "3333-3333-3333", name: "한정원", bookmark: false)
        ]
    }
}
