//
//  MoreView.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/16/24.
//

import UIKit

import SnapKit
import Then

final class MoreView: UIView {
    
    //MARK: - UI Properties
    
    let label = UILabel()
    let image = UIImageView()
    let stackView = UIStackView()
    
    //MARK: - Life Cycle
    
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

extension MoreView {
    
    // MARK: - Private Func

    private func setupStyle() {
        label.do {
            $0.text = "더보기"
            $0.textColor = .kakaoBlue
            $0.font = .appleSemiBold(size: 16)
            $0.textAlignment = .center
        }
        
        image.do {
            $0.image = UIImage(resource: .icArrowBlue)
        }
        
        stackView.do {
            $0.axis = .horizontal
            $0.spacing = 9
            $0.alignment = .center
        }
    }
    
    private func setupHierarchy() {
        addSubview(stackView)
        
        stackView.addArrangedSubviews(label, image)
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
