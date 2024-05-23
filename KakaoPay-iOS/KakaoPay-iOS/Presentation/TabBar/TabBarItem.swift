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
        case .asset: return StringLiterals.TabBar.asset
        case .benefit: return StringLiterals.TabBar.benefit
        case .home: return StringLiterals.TabBar.home
        case .stock: return StringLiterals.TabBar.stock
        case .all: return StringLiterals.TabBar.all
        }
    }
    
    // 탭 별 전환될 화면 -> 나중에 하나씩 추가
    var targetViewController: UIViewController {
        switch self {
        case .asset: 
            let navigationController = UINavigationController(rootViewController: AssetViewController())
            return navigationController
        case .benefit: return ViewController()
        case .home: 
            let navigationController = UINavigationController(rootViewController: HomeViewController())
            return navigationController
        case .stock: return ViewController()
        case .all: return ViewController()
        }
    }
}
