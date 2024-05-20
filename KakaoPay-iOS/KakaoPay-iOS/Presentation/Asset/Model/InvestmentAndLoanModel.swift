//
//  InvestmentAndLoanModel.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/16/24.
//

import UIKit

struct InvestmentAndLoanModel {
    let image: UIImage
    let title: String
    let discription: String
}

extension InvestmentAndLoanModel {
    static func dummy() -> [InvestmentAndLoanModel] {
        return [
            InvestmentAndLoanModel(image: UIImage(resource: .imgNewspaper), title: "흥미로운 투자소식 5개 있어요", discription: "커뮤니티 보기"),
            InvestmentAndLoanModel(image: UIImage(resource: .imgLoanSchedule), title: "다가오는 대출 상환일정", discription: "매달 갚는 금액 확인하기")
        ]
    }
}
