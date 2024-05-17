//
//  DirectHeaderView.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/18/24.
//

import UIKit

import SnapKit
import Then

final class DirectHeaderView: UICollectionReusableView {

    // MARK: - UIComponent

    private let titleLabel = UILabel()

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

extension DirectHeaderView {
    
    //MARK: - Private Method

    private func setupStyle() {
        backgroundColor = .clear
        
        titleLabel.do {
            $0.text = "자산 바로가기"
            $0.font = .appleSemiBold(size: 23)
            $0.textAlignment = .center
        }
    }

    private func setupHierarchy() {
        addSubview(titleLabel)
    }

    private func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.leading.equalToSuperview().inset(24)
        }
    }
}
