//
//  CreateChannelAlertController.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 25.03.2021.
//

import UIKit

class CreateChannelAlertController: UIAlertController {
    
    var submitAction: UIAlertAction? {
        didSet {
            if let submitAction = submitAction {
                submitAction.isEnabled = false
                addAction(submitAction)
            }
        }
    }
    
    override func addTextField(configurationHandler: ((UITextField) -> Void)? = nil) {
        super.addTextField { [weak self] textField in
            textField.addTarget(self,
            action: #selector(self?.createChannelTextFieldDidChange(_:)),
            for: .editingChanged)
        }
    }
    
    @objc func createChannelTextFieldDidChange(_ textField: UITextField) {
        if let text = textField.text,
            !text.isEmptyOrOnlyWhitespaces {
            submitAction?.isEnabled = true
        } else {
            submitAction?.isEnabled = false
        }
    }
}
