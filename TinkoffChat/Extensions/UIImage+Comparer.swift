//
//  UIImage+Comparer.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 18.03.2021.
//

import UIKit

extension UIImage {
    func isEqual(to toImage: UIImage?) -> Bool {
        guard let data1 = self.pngData(),
        let data2 = toImage!.pngData()
            else { return false}

        return data1.elementsEqual(data2)
    }
}
