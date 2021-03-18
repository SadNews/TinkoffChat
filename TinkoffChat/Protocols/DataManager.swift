//
//  DataManager.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 17.03.2021.
//

import Foundation

protocol DataManager {

    func loadPersonData(completion: @escaping (PersonViewModel?) -> ())
    func savePersonData(_ person: PersonViewModel, completion: ((Bool) -> ())?)
}
