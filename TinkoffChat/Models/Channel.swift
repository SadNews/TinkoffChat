//
//  Channel.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 26.03.2021.
//

import Foundation

struct Channel {
    let identifier: String
    let name: String
    let lastMessage: String?
    let lastActivity: Date?
}
