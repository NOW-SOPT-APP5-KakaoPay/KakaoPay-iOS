//
//  DirectFooterView.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/18/24.
//

import UIKit

import SnapKit
import Then

final class DirectFooterView: UICollectionReusableView {

    // MARK: - UIComponent

    private let titleLabel = UILabel()
    private let discriptionLabel = UILabel()
    private let searchAssetButtonImageView = UIImageView()
    private let hideAssetLabelImageView = UIImageView()
    private let settingLabelImageView = UIImageView()
    private let labelStackView = UIStackView()
    
    // MARK: - Life Cycles
    
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

// MARK: - Extensions

extension DirectFooterView {
    
    //MARK: - Private Method

    private func setupStyle() {
        titleLabel.do {
            $0.text = "놓친 자산은 없을까?"
            $0.font = .appleSemiBold(size: 16)
            $0.textColor = .kakaoBlack
            $0.textAlignment = .center
        }
        
        discriptionLabel.do {
            $0.text = "빈틈없는 관리를 위해 빠진 자산을 찾아보세요"
            $0.font = .appleRegular(size: 14)
            $0.textColor = .kakaoBlack
            $0.textAlignment = .center
        }
        
        searchAssetButtonImageView.do {
            $0.image = .btnFindasset
        }
        
        hideAssetLabelImageView.do {
            $0.image = .btnHideasset
        }
        
        settingLabelImageView.do {
            $0.image = .btnAssetsetting
        }
        
        labelStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
        }
    }
    
    private func setupHierarchy() {
        addSubviews(
            titleLabel,
            discriptionLabel,
            searchAssetButtonImageView,
            labelStackView
        )
        labelStackView.addArrangedSubviews(hideAssetLabelImageView, settingLabelImageView)
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(44)
        }
        
        discriptionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        
        searchAssetButtonImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(discriptionLabel.snp.bottom).offset(24)
        }
        
        labelStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(searchAssetButtonImageView.snp.bottom).offset(50)
        }
    }
}
