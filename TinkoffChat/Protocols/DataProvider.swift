//
//  DataProvider.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 04.03.2021.
//

import Foundation

protocol DataProvider {
    func subscribeChannels(completion: @escaping ([Channel]?, Error?) -> Void)
    func subscribeMessages(forChannelWithId channelId: String,
                           completion: @escaping ([MessageCellModel]?, Error?) -> Void)
    func unsubscribeChannel()
    func createChannel(withName name: String, completion: @escaping (String) -> Void)
    func sendMessage(widthContent content: String, completion: @escaping () -> Void)
}
