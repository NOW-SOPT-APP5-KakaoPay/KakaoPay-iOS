//
//  TabBarItem.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/13.
//

import UIKit

enum TabBarItem: CaseIterable {
    
    case asset, benefit, home, stock, all

    // 선택되지 않은 탭
    var normalItem: UIImage? {
        switch self {
        case .asset:
            return .icAssetsGrey
        case .benefit:
            return .icBenefitsGrey
        case .home:
            return .icHomeGrey
        case .stock:
            return .icStocksGrey
        case .all:
            return .icAllGrey
        }
    }
    
    // 선택된 탭
    var selectedItem: UIImage? {
        switch self {
        case .asset:
            return .icAssetsBlack
        case .benefit:
            return .icBenefitsBlack
        case .home:
            return .icHomeBlack
        case .stock:
            return .icStocksBlack
        case .all:
            return .icAllBlack
        }
    }
    
    // 탭 별 제목
    var itemTitle: String? {
        switch self {
        case .asset: return "자산"
        case .benefit: return "혜택"
        case .home: return "홈"
        case .stock: return "주식"
        case .all: return "전체"
        }
    }
    
    // 탭 별 전환될 화면 -> 나중에 하나씩 추가
    var targetViewController: UIViewController {
        switch self {
        case .asset: return ViewController()
        case .benefit: return ViewController()
        case .home: return HomeViewController()
        case .stock: return ViewController()
        case .all: return ViewController()
        }
    }
}
