//
//  String+Content.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 26.03.2021.
//

import Foundation

extension String {
    var isEmptyOrOnlyWhitespaces: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || isEmpty
    }
}
