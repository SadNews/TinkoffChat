//
//  GCDDataManager.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 18.03.2021.
//

import UIKit

class GCDDataManager: DataManager {

    // MARK: - DataManager methods
    
    func loadPersonData(completion: @escaping (PersonViewModel?) -> Void) {
        DispatchQueue.global(qos: .utility).async {
            
            guard let data = FileManager.read(fileName: Constants.personDataFileName),
                  let person = try? JSONDecoder().decode(Person.self, from: data)
            else { return completion(nil) }
  
            var image: UIImage?
            if let profileImageUrl = person.imageUrl,
                let imageData = FileManager.read(url: profileImageUrl) {
                image = UIImage(data: imageData)
            }
            
            completion(.init(fullName: person.fullName, description: person.description, profileImage: image))
        }
    }
    
    func savePersonData(_ personViewModel: PersonViewModel, completion: ((Bool) -> Void)? = nil) {
        DispatchQueue.global(qos: .utility).async {
            var imageSavedSuccessfully = false
            var dataSavedSuccessfully = false
            
            var imageUrl: URL?
            if let imageData = personViewModel.profileImage?.pngData() {
                (imageSavedSuccessfully, imageUrl) =
                    FileManager.write(data: imageData, fileName: Constants.personImageFileName)
            } else if personViewModel.profileImage == nil {
                imageSavedSuccessfully = true
            }
            
            let person = Person(fullName: personViewModel.fullName, description: personViewModel.description, imageUrl: imageUrl)
            
            if let data = try? JSONEncoder().encode(person),
               FileManager.write(data: data, fileName: Constants.personDataFileName).isSuccessful {
                dataSavedSuccessfully = true
            }
            
            if let completion = completion {
                completion(imageSavedSuccessfully && dataSavedSuccessfully)
            }
        }
    }
    
    func getUserId(completion: @escaping ((String) -> Void)) {
        DispatchQueue.global(qos: .utility).async {
            let userIdKey = "UserId"
            let userDefaults = UserDefaults.standard
        
            if let userId = userDefaults.string(forKey: userIdKey) {
                completion(userId)
            } else {
                let userId = UUID().uuidString
                userDefaults.set(userId, forKey: userIdKey)
                completion(userId)
            }
        }
    }
}
