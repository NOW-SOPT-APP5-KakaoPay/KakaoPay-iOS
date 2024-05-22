//
//  TotalMoneyModel.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/16/24.
//

struct TotalMoneyModel {
    let totalMoney: String
}

extension TotalMoneyModel {
    static func dummy() -> TotalMoneyModel {
        return TotalMoneyModel(totalMoney: "20,007,500원")
    }
}
