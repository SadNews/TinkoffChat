//
//  LogManager.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 18.02.2021.
//

import Foundation

final class LogManager{
    private init() {}

    static var showLog: Bool = true

    static func showMessage(_ text: String){
        if showLog{
            print(text)
        }
    }
}
