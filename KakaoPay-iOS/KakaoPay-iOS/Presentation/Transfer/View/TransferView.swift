//
//  TransferView.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/13.
//

import UIKit

import SnapKit
import Then

final class TransferView: UIView {
    
    // MARK: - UI Components
    
    let transferTableView = UITableView()
    private let headerView = TransferHeaderView()
    private let qrButton = UIButton()
    private let accountButton = UIButton()
    
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

private extension TransferView {
    func setStyle() {
        self.backgroundColor = .kakaoWhite
        transferTableView.do {
            $0.backgroundColor = .clear
            $0.separatorStyle = .none
            $0.sectionHeaderTopPadding = 9
        }
        
        qrButton.do {
            $0.makeRoundBorder(cornerRadius: 28.5, borderWidth: 1, borderColor: .kakaoBluegray400)
            $0.setImage(.imgQrscan, for: .normal)
        }
        
        accountButton.do {
            $0.makeRoundBorder(cornerRadius: 28.5, borderWidth: 1, borderColor: .kakaoYellow)
            $0.setTitle("계좌번호 입력", for: .normal)
            $0.setTitleColor(.kakaoBlack, for: .normal)
            $0.titleLabel?.font = .appleSemiBold(size: 18)
            $0.backgroundColor = .kakaoYellow
        }
    }
    
    func setHierarchy() {
        addSubviews(transferTableView, headerView, qrButton, accountButton)
    }
    
    func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        transferTableView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(700)
        }
        
        qrButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(48)
            $0.leading.equalToSuperview().inset(20)
            $0.width.equalTo(112)
            $0.height.equalTo(57)
        }
        
        accountButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(48)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(223)
            $0.height.equalTo(57)
        }
    }
}

extension TransferView {
    func updateTableView() {
        transferTableView.reloadData()
    }
}
