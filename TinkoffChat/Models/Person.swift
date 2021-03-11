//
//  Person.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 04.03.2021.
//

import UIKit

struct Person {
    var firstName: String
    var secondName: String?
    var profileImage: UIImage?

    var initials: String {
        let firstLetter = firstName.prefix(1).capitalized
        let secondLetter = secondName?.prefix(1).capitalized ?? ""

        return "\(firstLetter)\(secondLetter)"
    }

    var fullName: String {
        if let secondName = self.secondName {
            return "\(firstName) \(secondName)"
        }
        return "\(firstName)"
    }
}
