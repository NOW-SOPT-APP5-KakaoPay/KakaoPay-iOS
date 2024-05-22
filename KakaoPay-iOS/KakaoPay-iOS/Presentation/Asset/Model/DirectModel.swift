//
//  DirectModel.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/17/24.
//

import UIKit

struct DirectModel {
    let iconImage: UIImage
    let menu: String
}

extension DirectModel {
    static func dummy() -> [DirectModel] {
        return [
            DirectModel(iconImage: UIImage(resource: .icAccount), menu: "계좌"),
            DirectModel(iconImage: UIImage(resource: .icCard), menu: "카드"),
            DirectModel(iconImage: UIImage(resource: .icFund), menu: "주식·펀드"),
            DirectModel(iconImage: UIImage(resource: .icInsure), menu: "보험"),
            DirectModel(iconImage: UIImage(resource: .icLoans), menu: "대출"),
            DirectModel(iconImage: UIImage(resource: .icPoint), menu: "포인트·머니"),
            DirectModel(iconImage: UIImage(resource: .icAnnuity), menu: "연금·퇴직연금"),
            DirectModel(iconImage: UIImage(resource: .icComm), menu: "통신"),
            DirectModel(iconImage: UIImage(resource: .icCar), menu: "자동차"),
            DirectModel(iconImage: UIImage(resource: .icReales), menu: "부동산"),
            DirectModel(iconImage: UIImage(resource: .icOther), menu: "기타자산")
        ]
    }
}
