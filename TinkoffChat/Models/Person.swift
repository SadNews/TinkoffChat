//
//  Person.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 17.03.2021.
//

import Foundation

struct Person: Codable {
    var fullName: String
    var description: String?
    var imageUrl: URL?
}
