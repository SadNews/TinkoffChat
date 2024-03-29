//
//  DummyDataProvider.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 04.03.2021.
//

import Foundation

class DummyDataProvider: DataProvider {
    
    func getConversations() -> [ConversationCellModel] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return [
            .init(name: "Ronald Robertson",
                  message: "An suas viderer pro. Vis cu magna altera, ex his vivendo atomorum.",
                  date: Date(),
                  isOnline: true,
                  hasUnreadMessages: true),
            .init(name: "Johnny Watson",
                  message: "Reprehenderit mollit excepteur labore deserunt officia laboris eiusmod cillum eu duis.",
                  date: dateFormatter.date(from: "2020-09-28") ?? Date(),
                  isOnline: true,
                  hasUnreadMessages: true),
            .init(name: "Martha Craig",
                  message: "Aliqua mollit nisi incididunt id eu consequat eu cupidatat.",
                  date: dateFormatter.date(from: "2020-09-28") ?? Date(),
                  isOnline: true,
                  hasUnreadMessages: true),
            .init(name: "Arthur Bell",
                  message: "Voluptate irure aliquip consectetur commodo ex ex.",
                  date: dateFormatter.date(from: "2020-09-25") ?? Date(),
                  isOnline: true,
                  hasUnreadMessages: false),
            .init(name: "Jane Warren",
                  message: "Ex Lorem veniam veniam irure sunt adipisicing culpa.",
                  date: dateFormatter.date(from: "2020-09-16") ?? Date(),
                  isOnline: true,
                  hasUnreadMessages: false),
            .init(name: "Morris Henry",
                  message: "Commodo ligula eget dolor. Aenean massa. Cum sociis natoque.",
                  date: dateFormatter.date(from: "2020-08-27") ?? Date(),
                  isOnline: true,
                  hasUnreadMessages: false),
            .init(name: "Colin Williams",
                  message: "Dolore veniam Lorem occaecat veniam irure laborum est amet.",
                  date: dateFormatter.date(from: "2020-07-15") ?? Date(),
                  isOnline: true,
                  hasUnreadMessages: true),
            .init(name: "Irma Flores",
                  message: "",
                  date: Date(),
                  isOnline: true,
                  hasUnreadMessages: false),
            .init(name: "Cataleya Levy",
                  message: "",
                  date: Date(),
                  isOnline: true,
                  hasUnreadMessages: false),
            .init(name: "Beatriz Garner",
                  message: "",
                  date: Date(),
                  isOnline: true,
                  hasUnreadMessages: false),
            .init(name: "Ronald Robertson",
                  message: "Penatibus et magnis dis parturient montes, nascetur ridiculus mus.",
                  date: Date(),
                  isOnline: false,
                  hasUnreadMessages: true),
            .init(name: "Rui Roman",
                  message: "Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.",
                  date: Date(),
                  isOnline: false,
                  hasUnreadMessages: true),
            .init(name: "Brenda Fisher",
                  message: "Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec.",
                  date: dateFormatter.date(from: "2020-09-26") ?? Date(),
                  isOnline: false,
                  hasUnreadMessages: true),
            .init(name: "Ami Samuels",
                  message: "Valputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nulla dictum felis eu pede.",
                  date: dateFormatter.date(from: "2020-09-25") ?? Date(),
                  isOnline: false,
                  hasUnreadMessages: false),
            .init(name: "Muhammad Holland",
                  message: "Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi.",
                  date: dateFormatter.date(from: "2020-09-22") ?? Date(),
                  isOnline: false,
                  hasUnreadMessages: false),
            .init(name: "Carrie-Ann Meyers",
                  message: "Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac.",
                  date: dateFormatter.date(from: "2020-09-20") ?? Date(),
                  isOnline: false,
                  hasUnreadMessages: false),
            .init(name: "Lilian Mcfarlane",
                  message: "",
                  date: Date(),
                  isOnline: false,
                  hasUnreadMessages: false),
            .init(name: "Carrie Foley",
                  message: "Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus.",
                  date: dateFormatter.date(from: "2020-08-12") ?? Date(),
                  isOnline: false,
                  hasUnreadMessages: false),
            .init(name: "Saoirse Grant",
                  message: "Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum.",
                  date: dateFormatter.date(from: "2020-06-28") ?? Date(),
                  isOnline: false,
                  hasUnreadMessages: false),
            .init(name: "Spike Curry",
                  message: "Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id.",
                  date: dateFormatter.date(from: "2020-05-01") ?? Date(),
                  isOnline: false,
                  hasUnreadMessages: false),
            .init(name: "Henry Foley",
                  message: "Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc",
                  date: dateFormatter.date(from: "2020-05-01") ?? Date(),
                  isOnline: false,
                  hasUnreadMessages: false),
            ]
    }
    
    func getMessages() -> [MessageCellModel] {
        return [
            .init(text: "An suas viderer pro. Vis cu magna altera, ex his vivendo atomorum",
                  isIncoming: true),
            .init(text: "Reprehenderit mollit excepteur labore deserunt officia laboris eiusmod cillum eu duis",
                  isIncoming: true),
            .init(text: "Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.",
                  isIncoming: false),
            .init(text: "Sed consequat",
                  isIncoming: true),
            .init(text: "Maecenas",
                  isIncoming: false),
            .init(text: "Integer tincidunt. Cras dapibus.",
                  isIncoming: false),
            .init(text: "Penatibus et magnis dis parturient montes, nascetur ridiculus mus",
                  isIncoming: true),
            .init(text: "Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec.",
                  isIncoming: true),
            .init(text: "Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac",
                  isIncoming: true),
            .init(text: "An suas viderer pro. Vis cu magna altera, ex his vivendo atomorum",
                  isIncoming: true),
            .init(text: "Reprehenderit mollit excepteur labore deserunt officia laboris eiusmod cillum eu duis",
                  isIncoming: true),
            .init(text: "Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.",
                  isIncoming: false),
            .init(text: "Sed consequat",
                  isIncoming: true),
            .init(text: "Maecenas",
                  isIncoming: false),
            .init(text: "Integer tincidunt. Cras dapibus.",
                  isIncoming: false),
            .init(text: "Penatibus et magnis dis parturient montes, nascetur ridiculus mus",
                  isIncoming: true),
            .init(text: "Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec.",
                  isIncoming: true),
            .init(text: "Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac",
                  isIncoming: true),
            .init(text: "Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id.",
                  isIncoming: false),
            .init(text: "Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc",
                  isIncoming: true),
            .init(text: "Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum.",
                  isIncoming: false),
            .init(text: "Cras dapibus.",
                  isIncoming: false),
            .init(text: "Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus.",
                  isIncoming: true),
        ]
    }
}
