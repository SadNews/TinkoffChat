//
//  Date+Formatter.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 05.03.2021.
//

import Foundation

extension Date {

    func formatted(with format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }
}
