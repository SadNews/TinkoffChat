//
//  FileManager+Operations.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 18.03.2021.
//

import Foundation

extension FileManager {
    static var documentsDirectoryUrl: URL? {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }

    static func write(data: Data, fileName: String) -> (isSuccessful: Bool, url: URL?) {
        guard let url = documentsDirectoryUrl?.appendingPathComponent(fileName)
            else { return (false, nil) }

        do {
            try data.write(to: url)
            return (true, url)
        } catch {
            return (false, nil)
        }
    }

    static func read(fileName: String) -> Data? {
        guard let url = documentsDirectoryUrl?.appendingPathComponent(fileName) else {
            return nil
        }

        return try? Data(contentsOf: url)
    }

    static func read(url: URL) -> Data? {
        return try? Data(contentsOf: url)
    }
}
