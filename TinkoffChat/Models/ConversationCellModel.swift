//
//  ConversationCellModel.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 04.03.2021.
//

import Foundation

struct ConversationCellModel {
    let name: String
    let message: String
    let date: Date
    let isOnline: Bool
    let hasUnreadMessages: Bool
}
