//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Mehmet Turan on 10/15/19.
//  Copyright © 2019 Mehmet Turan. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //keyboard close func
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        //kullanıcı fotoğrafa tıklayabiliyor mu?
        imageView.isUserInteractionEnabled=true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapRecognizer)
        
        //keyboard viewde kapalı durması için
        view.addGestureRecognizer(gestureRecognizer)
        
        
        
        

        // Do any additional setup after loading the view.
    }
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        print("test")
    }
    @objc func selectImage(){
        //galeriye gitmek için
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true //zoomlama işlemlerini yapabilme
        present(picker,animated: true,completion: nil)
        
    }
    //media seçilince dosyanın IDsini alıyor
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info [.originalImage] as? UIImage // başka bir dosya mı seçecek? vazmı geçecek
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
