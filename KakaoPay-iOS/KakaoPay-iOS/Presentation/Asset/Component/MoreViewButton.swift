//
//  MoreViewButton.swift
//  KakaoPay-iOS
//
//  Created by 조혜린 on 5/16/24.
//

import UIKit

final class MoreViewButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MoreViewButton {
    
    // MARK: - Private Func

    private func setStyle() {
        setTitle("더보기", for: .normal)
        setTitleColor(.kakaoBlue, for: .normal)
        titleLabel?.font = .appleSemiBold(size: 16)
    }
}
