//
//  NetworkManager.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 24.03.2021.
//

import Foundation

protocol NetworkManager {
    func subscribeChannels(completion: @escaping ([Channel]?, Error?) -> Void)
    func subscribeMessages(forChannelWithId channelId: String,
                           completion: @escaping ([Message]?, Error?) -> Void)
    func unsubscribeChannel()
    func createChannel(withName name: String, completion: @escaping (String) -> Void)
    func sendMessage(widthContent content: String,
                     senderId: String,
                     senderName: String,
                     completion: @escaping () -> Void)
}
