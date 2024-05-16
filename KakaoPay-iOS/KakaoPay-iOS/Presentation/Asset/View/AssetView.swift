//
//  AssetView.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/16/24.
//

import UIKit

import SnapKit
import Then

final class AssetView: UIView {
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    private let assetCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension AssetView {
    
    //MARK: - Private Method
    
    private func setupStyle() {
        self.backgroundColor = .kakaoGray200
        
        assetCollectionView.do {
            $0.collectionViewLayout = CompositionalFactory.create()
            $0.backgroundColor = .clear
            $0.register(TotalMoneyCell.self, forCellWithReuseIdentifier: TotalMoneyCell.className)
            $0.register(AccontCell.self, forCellWithReuseIdentifier: AccontCell.className)
            $0.register(MoneyHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:MoneyHeaderView.className)
            $0.register(AccountFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: AccountFooterView.className)
            $0.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.className)
            $0.register(SpendingCell.self, forCellWithReuseIdentifier: SpendingCell.className)
            $0.register(investmentAndLoanCell.self, forCellWithReuseIdentifier: investmentAndLoanCell.className)
        }
    }
    
    private func setupHierarchy() {
        addSubview(assetCollectionView)
    }
    
    private func setupLayout() {
        assetCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    //MARK: - Method
    
    func setupCollectionView(_ viewController: UIViewController) {
        assetCollectionView.delegate = viewController as? UICollectionViewDelegate
        assetCollectionView.dataSource = viewController as? UICollectionViewDataSource
    }
}

