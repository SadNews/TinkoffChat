//
//  PersonViewModel.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 17.03.2021.
//

import UIKit

struct PersonViewModel {
    var fullName: String
    var firstName: String? {
        fullName.components(separatedBy: .whitespacesAndNewlines).first
    }
    var secondName: String? {
        let words = fullName.components(separatedBy: .whitespacesAndNewlines).filter { !$0.isEmpty }
        return words.count > 1 ? words[1] : nil
    }
    var description: String?
    var profileImage: UIImage?

    var initials: String {
        let firstLetter = firstName?.prefix(1).capitalized ?? ""
        let secondLetter = secondName?.prefix(1).capitalized ?? ""

        return "\(firstLetter)\(secondLetter)"
    }
}
