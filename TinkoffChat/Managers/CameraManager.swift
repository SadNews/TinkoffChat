//
//  CameraManager.swift
//  TinkoffChat
//
//  Created by Андрей Ушаков on 18.03.2021.
//

import UIKit
import MobileCoreServices
import AVFoundation

class CameraManager {
    static func checkCameraPermission() -> Bool {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            return true
        case .notDetermined:
            var result: Bool = false
            let semaphore = DispatchSemaphore(value: 0)
            AVCaptureDevice.requestAccess(for: .video) { granted in
                result = granted
                semaphore.signal()
            }
            semaphore.wait()
            return result
        case .denied, .restricted:
            return false
        @unknown default:
            return false
        }
    }
}
