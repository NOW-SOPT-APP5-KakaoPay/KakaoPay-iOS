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
        
        view.backgroundColor = .kakaoYellow
        
        setaddTarget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
        setupStyle()
        setNavigationBar()
        
        getPayPointAPI()
        getPayMoneyAPI()
    }
}

private extension PaymentViewController {
    
    func setupStyle() {
        changeStatusBarBgColor(statusBarColor: .kakaoYellow)
    }

    func setNavigationBar() {
        if let navigationBar = self.navigationController?.navigationBar {
            let emptyImage = UIImage()
            navigationBar.backgroundColor = .kakaoYellow
            navigationBar.barTintColor = .kakaoYellow
            navigationBar.isTranslucent = false
            navigationBar.shadowImage = emptyImage
            navigationBar.tintColor = .kakaoBlack
        }
        
        let mainBarButton = UIBarButtonItem(image: .icNavigationKakaopay, style: .plain, target: self, action: nil)
        
        let worldPayBarButton = UIButton()
        worldPayBarButton.setImage(.icNavigationWorldpay, for: .normal)
        
        let settingBarButton = UIButton()
        settingBarButton.setImage(.icNavigationSetting, for: .normal)
        
        let stackView = UIStackView(arrangedSubviews: [worldPayBarButton, settingBarButton])
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        let customView = UIBarButtonItem(customView: stackView)
        
        self.navigationItem.leftBarButtonItem = mainBarButton
        self.navigationItem.rightBarButtonItem = customView
    }
    
    func setaddTarget() {
        rootView.closeButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    @objc
    func tappedButton() {
        print("닫기 버튼 클릭")
        navigationController?.popViewController(animated: false)
    }
}

// MARK: - Network

private extension PaymentViewController {
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
