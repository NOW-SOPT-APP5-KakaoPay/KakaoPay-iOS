//
//  NSObject+.swift
//  KakaoPay-iOS
//
//  Created by Gahyun Kim on 2024/05/10.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
