//
//  MoneyHeaderView.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/16/24.
//

import UIKit

import SnapKit
import Then

final class MoneyHeaderView: UICollectionReusableView {
    
    // MARK: - UI Component
    
    private let titleLabel = UILabel()
    private let moreView = MoreView()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MoneyHeaderView {
    
    //MARK: - Private Method
    
    private func setupStyle() {
        backgroundColor = .kakaoWhite
        makeRounded(radius: 15)
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        titleLabel.do {
            $0.font = .appleSemiBold(size: 20)
            $0.textAlignment = .center
        }
    }
    
    private func setupHierarchy() {
        addSubviews(titleLabel, moreView)
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(20)
        }
        
        moreView.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(18)
            $0.width.equalTo(55)
            $0.height.equalTo(19)
        }
    }
    
    //MARK: - Method
    
    func configureGrayTitleHeader(forTitle: String) {
        titleLabel.text = forTitle
        titleLabel.textColor = .kakaoGray600
    }
    
    func configureBlackTitleHeader(forTitle: String) {
        titleLabel.text = forTitle
        titleLabel.textColor = .kakaoBlack
    }
}
