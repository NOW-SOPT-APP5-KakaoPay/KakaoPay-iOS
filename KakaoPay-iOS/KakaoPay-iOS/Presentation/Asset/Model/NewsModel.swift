//
//  NewsModel.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/16/24.
//

import UIKit

struct NewsModel {
    let image: UIImage
    let discription: String
    let main: String
}

extension NewsModel {
    static func dummy() -> [NewsModel] {
        return [NewsModel(image: UIImage(resource: .imgChoonsik), discription: "이가인님 소식", main: "1개 발견"), NewsModel(image: UIImage(resource: .imgCalendar), discription: "2일 후", main: "카드값 내는 날"), NewsModel(image: UIImage(resource: .imgCreditscore), discription: "신용점수", main: "NICE 894")]
    }
}
