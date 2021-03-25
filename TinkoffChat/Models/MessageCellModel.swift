//
//  MessageCellModel.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 04.03.2021.
//

import Foundation

struct MessageCellModel {
    let content: String
    let senderId: String
    let senderName: String
    var isIncoming: Bool {
        senderId != userId
    }
    let userId: String
}
