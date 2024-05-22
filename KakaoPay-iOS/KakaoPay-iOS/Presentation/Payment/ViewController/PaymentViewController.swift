//
//  PaymentViewController.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/15.
//

import UIKit

final class PaymentViewController: UIViewController {
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getPayPointAPI()
        getPayMoneyAPI()
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
    
    func getPayPointAPI() {
        PayPointService.shared.getPayPointAPI { response in
            switch response {
            case .success(let data):
                guard let data = data as? GetPayPointDTO else { return }
                DispatchQueue.main.async {
                    self.rootView.customView.bindPayPoint(forModel: data.data)
                }
                print("SUCCESS")
            default:
                print("ERROR")
            }
        }
    }
    
    func getPayMoneyAPI() {
        PayMoneyService.shared.getPayMoneyAPI { response in
            switch response {
            case .success(let data):
                guard let data = data as? GetPayMoneyDTO else { return }
                DispatchQueue.main.async {
                    self.rootView.customView.bindPayMoney(forModel: data.data)
                }
                print("SUCCESS")
            default:
                print("ERROR")
            }
        }
    }
    
}
