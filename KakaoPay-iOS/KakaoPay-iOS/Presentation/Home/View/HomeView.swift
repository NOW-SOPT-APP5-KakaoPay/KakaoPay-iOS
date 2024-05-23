//
//  HomeView.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/10.
//

import UIKit

import SnapKit
import Then

final class HomeView: UIView {
    
    // MARK: - UI Components
    
    private let customTabBar = CustomTabBar()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 11, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    let payButton = UIButton()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension HomeView {
    func setStyle() {
        collectionView.backgroundColor = .kakaoGray200
        payButton.do {
            $0.setTitle("현장 결제", for: .normal)
            $0.setTitleColor(.kakaoBlack, for: .normal)
            $0.backgroundColor = .kakaoYellow
            $0.titleLabel?.font = .appleSemiBold(size: 16)
        }
    }
    
    func setHierarchy() {
        addSubviews(collectionView, payButton)
    }
    
    func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(144)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
        
        payButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(94)
            $0.height.equalTo(50)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
    }
}
