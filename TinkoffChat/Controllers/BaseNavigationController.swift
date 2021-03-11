//
//  BaseNavigationController.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 11.03.2021.
//

import UIKit

class BaseNavigationController: UINavigationController {

    // MARK: - UI
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        Appearance.shared.currentTheme?.statusBarStyle ?? .default
    }
}
