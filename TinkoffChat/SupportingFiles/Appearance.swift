//
//  Appereance.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 05.03.2021.
//

import UIKit

class Appearance {

    // MARK: - Regular fonts
    
    static let font13 = UIFont.systemFont(ofSize: 13)
    static let font15 = UIFont.systemFont(ofSize: 15)

    // MARK: - Medium fonts
    
    static let mediumFont115 = UIFont.systemFont(ofSize: 115, weight: .medium)
    static let mediumFont15 = UIFont.systemFont(ofSize: 15, weight: .medium)
    static let mediumFont13 = UIFont.systemFont(ofSize: 13, weight: .medium)

    // MARK: - Bold fonts
    
    static let boldFont13 = UIFont.systemFont(ofSize: 13, weight: .bold)
    static let boldFont24 = UIFont.systemFont(ofSize: 24, weight: .bold)

    // MARK: - Italic fonts
    
    static let italicFont13 = UIFont.italicSystemFont(ofSize: 13)

    // MARK: - Sizes
    
    static let baseCornerRadius: CGFloat = 14

    // MARK: - Colors
    
    static let yellow = UIColor(named: "Yellow")
    static let lightYellow = UIColor(named: "LightYellow")
    static let labelLight = UIColor(named: "LabelLight")
    static let darkGray = UIColor(named: "DarkGray")
    static let incomingMessageColor = UIColor(named: "IncomingMessage")
    static let outgoingMessageColor = UIColor(named: "OutgoingMessage")
    static let selectionColor = UIColor(named: "SelectionColor")
}
