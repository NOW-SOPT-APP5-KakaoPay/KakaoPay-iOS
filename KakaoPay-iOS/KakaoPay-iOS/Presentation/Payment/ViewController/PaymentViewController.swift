//
//  PaymentViewController.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/15.
//

import UIKit

final class PaymentViewController: UIViewController {
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    private let rootView = PaymentView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setaddTarget()
    }
}


private extension PaymentViewController {
    func setaddTarget() {
        rootView.closeButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    @objc
    func tappedButton() {
        print("닫기 버튼 클릭")
        navigationController?.popViewController(animated: false)
    }
}
