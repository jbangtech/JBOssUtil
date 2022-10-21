//
//  ViewController.swift
//  JBOssUtil
//
//  Created by echanz on 08/22/2022.
//  Copyright (c) 2022 echanz. All rights reserved.
//

import UIKit
import JBOssUtil

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        JBOssUtil.setupApiInfo(authorizationKey: "JB-Authorization",
                                   isDistribution: false,
                                   devDomain: "pcba.jbangit.com",
                                   disDomain: "user-api.pcbaapp.com",
                                   devSuffix: "/user",
                                   disSuffix: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func openPhotoPickerAction(_ sender: Any) {
        let photoPicker =  UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.sourceType = .photoLibrary
        present(photoPicker, animated: true) { }
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        picker.dismiss(animated: true)
        JBOssUtil.shared.upload(image, folder: "user/image") { result, progress, errorMsg  in
            if let errorMsg {
                print("错误信息：==> ", errorMsg)
                return
            }
            if let progress {
                let array = progress.components(separatedBy: ",")
                // 发送字节数
                let bytesSent = Double(array[0])
                // 已发送字节数
                guard let totalBytesSent = Double(array[1]) else { return }
                // 总字节数
                guard let totalBytesExpectedToSend = Double(array[2]) else { return }
                // 百分比（已发送字节/总字节）
                let percentage = totalBytesSent / totalBytesExpectedToSend * Double(100)
                print("进度：==> ", String.init(format: "%.0f%@", percentage, "%"))
            }
            if let result {
                print("图片URL：==> ", result)
            }
        }
    }
    
}

