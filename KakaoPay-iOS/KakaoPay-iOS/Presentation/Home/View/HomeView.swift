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
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 11, right: 0)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
//    private let personalLabel = UILabel()
//    private let customerCenterLabel = UILabel()
//    private let reportLabel = UILabel()

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
//        
//        personalLabel.do {
//            $0.text = "개인정보처리방침"
//            $0.font = .appleRegular(size: 14)
//            $0.textColor = .kakaoGray600
//        }
//        
//        customerCenterLabel.do {
//            $0.text = "고객센터"
//            $0.font = .appleRegular(size: 14)
//            $0.textColor = .kakaoGray600
//        }
//        
//        reportLabel.do {
//            $0.text = "신고하기"
//            $0.font = .appleRegular(size: 14)
//            $0.textColor = .kakaoGray600
//        }
    }
    
    func setHierarchy() {
        addSubview(collectionView)
    }
    
    func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.bottom.horizontalEdges.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
    }
}
