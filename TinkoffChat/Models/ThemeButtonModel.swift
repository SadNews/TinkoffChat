//
//  ThemeButtonModel.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 11.03.2021.
//

import UIKit

struct ThemeModel {
    let id: Int
    let name: String
    let incomingMessageColor: UIColor?
    let outgoingMessageColor: UIColor?
    let labelColor: UIColor?
    let backgroundColor: UIColor?
    let statusBarStyle: UIStatusBarStyle
    let grayColor: UIColor?
    let yellowColor: UIColor?
    let uiUserInterfaceStyle: UIUserInterfaceStyle

    var isSelected: Bool {
        Appearance.shared.currentTheme?.id == id
    }
}
