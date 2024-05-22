//
//  HomeModel.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/22.
//

import Foundation
import UIKit

struct HomeModel {
    let image: UIImageView
    let menu: String
}

extension HomeModel {
    static func dummy() -> [HomeModel] {
        return [
            HomeModel(image: UIImageView(image: .), menu: <#T##String#>)
        ]
    }
}
