//
//  Message.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 26.03.2021.
//

import Foundation
import Firebase

struct Message {
    let content: String
    let created: Date
    let senderId: String
    let senderName: String
}
