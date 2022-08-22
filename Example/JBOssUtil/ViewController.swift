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
        JBOssUtil.shared.upload(image, folder: "user/image") { result in
            print("图片URL：==> ", result)
        }
    }
    
}

