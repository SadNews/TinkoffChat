//
//  DataProvider.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 04.03.2021.
//

import Foundation

protocol DataProvider {
    func getConversations() -> [ConversationCellModel]
    func getMessages() -> [MessageCellModel]
}
