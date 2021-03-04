//
//  ConfigurableView.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 04.03.2021.
//

import Foundation

protocol ConfigurableView {

    associatedtype ConfigurationModel

    func configure(with model: ConfigurationModel)
}
