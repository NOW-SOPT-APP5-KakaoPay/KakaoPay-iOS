//
//  StringLiterals.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/10.
//

import Foundation

enum StringLiterals {
    enum TabBar {
        static let asset = "자산"
        static let benefit = "혜택"
        static let home = "홈"
        static let stock = "주식"
        static let all = "전체"
    }
    
    enum Transfer {
        static let addAccount = "계좌추가"
        static let myAccount = "내 계좌"
        static let countPlusOne = "+1개"
        static let recentAccount = "최근"
    }
    
    enum Asset {
        static let totalMoney = "모은 돈"
        static let account = "계좌"
        static let pointMoney = "포인트·머니"
        static let spentMoney = "쓴 돈"
        static let investedMoney = "투자한 돈"
        static let borrowesMoney = "빌린 돈"
        static let assetDirect = "자산 바로가기"
    }
    
    enum Payment {
        static let savePaypoint = "페이포인트 0.5% 적립"
        static let paymoney = "페이머니"
        static let paypoint = "페이포인트 사용"
        static let availablecoupon  = "사용 가능한 쿠폰"
        static let kakaoPayCard = "카카오페이머니"
    }
}
