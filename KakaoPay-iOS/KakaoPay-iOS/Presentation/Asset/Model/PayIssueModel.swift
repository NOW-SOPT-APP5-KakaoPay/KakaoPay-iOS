//
//  PayIssueModel.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/17/24.
//

import UIKit

struct PayIssueModel {
    let image: UIImage
    let discription: String
    let title: String
}

extension PayIssueModel {
    static func dummy() -> [PayIssueModel] {
        return [
            PayIssueModel(image: UIImage(resource: .imgPayissue1), discription: "우리 부부 재테크 시작", title: "함께하는 자산관리"),
            PayIssueModel(image: UIImage(resource: .imgPayissue2), discription: "스스로 지키는 노후", title: "연금·퇴직연금"),
            PayIssueModel(image: UIImage(resource: .imgPayissue3), discription: "주택청약 당첨 가능성은?", title: "내 청약 진단하기"),
            PayIssueModel(image: UIImage(resource: .imgPayissue4), discription: "스스로 지키는 노후", title: "신용점수 올리기")
        ]
    }
}
