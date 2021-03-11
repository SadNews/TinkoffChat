//
//  ProfileViewController.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 18.02.2021.
//

import UIKit
import MobileCoreServices
import AVFoundation

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: ProfileImageView!
    @IBOutlet weak var profileImageLabel: UILabel!
    @IBOutlet weak var profileEditButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    private let dataProvider: DataProvider = DummyDataProvider()
    private lazy var person = dataProvider.getUser()
    private lazy var imagePickerController: UIImagePickerController = {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        vc.mediaTypes = [kUTTypeImage as String]
        return vc
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // LogManager.showMessage("\(profileEditButton.frame)")
        // Будет краш, т.к. UI еще не загрузился
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // для отключения логов ->
        // LogManager.showLog = false
        LogManager.showMessage(#function)
        LogManager.showMessage("\(profileEditButton.frame)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        saveButton.layer.cornerRadius = 15
        LogManager.showMessage(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        LogManager.showMessage(#function)
        LogManager.showMessage("\(profileEditButton.frame)")
        profileImageView.configure(with: person)
        // Во viewDidLoad констрейнты еще не установлены долдным образом
        // и размеры вьюшек не определны окончательно
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        LogManager.showMessage(#function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        LogManager.showMessage(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        LogManager.showMessage(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        LogManager.showMessage(#function)
    }
    
    @IBAction private func profileImageEditButtonPressed(_ sender: Any) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        var actions = [
                  UIAlertAction(title: "Open Gallery", style: .default) { [unowned self] _ in
                      self.presentImagePicker(sourceType: .photoLibrary)
                  },
                  UIAlertAction(title: "Take Photo", style: .default) { [unowned self] _ in
                      self.checkCameraPermission()
                  }]

              if (person.profileImage != nil) {
                  actions.append(UIAlertAction(title: "Remove Photo", style: .destructive) { [unowned self] _ in
                      self.setProfileImage(image: nil)
                  })
              }

              actions.append(UIAlertAction(title: "Cancel", style: .cancel))

        
        actions.forEach { alertController.addAction($0) }
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func presentImagePicker(sourceType: UIImagePickerController.SourceType) {
        if !UIImagePickerController.isSourceTypeAvailable(sourceType) {
            showErrorAlert()
            return
        }
        
        imagePickerController.sourceType = sourceType
        DispatchQueue.main.async {
            self.present(self.imagePickerController, animated: true)
        }
    }
    
    private func showErrorAlert() {
        let alertController = UIAlertController(title: "Error", message: "This action is not allowed.", preferredStyle: .alert)
        alertController.addAction(.init(title: "OK", style: .cancel, handler: nil))
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
          dismiss(animated: true, completion: nil)
      }
    
    private func setupLayout() {
           profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
           saveButton.layer.cornerRadius = Appearance.baseCornerRadius
           navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .cancel,
                                                     target: self,
                                                     action: #selector(cancel))
           navigationItem.title = "My Profile"
       }
    
    private func setProfileImage(image: UIImage?) {
         person.profileImage = image
         profileImageView.configure(with: person)
     }

     @objc private func cancel() {
         dismiss(animated: true, completion: nil)
     }

    
    func checkCameraPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            return presentImagePicker(sourceType: .camera)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    self.presentImagePicker(sourceType: .camera)
                } else {
                    self.showErrorAlert()
                }
            }
        default:
            showErrorAlert()
        }
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.editedImage] as? UIImage else {
            showErrorAlert()
            return
        }
        
        setProfileImage(image: image)
    }
}
