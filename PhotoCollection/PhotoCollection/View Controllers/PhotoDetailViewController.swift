//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Michael on 12/19/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var photoController: PhotoController?
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    var themeHelper: ThemeHelper?
    
    
    
    var imagePicker: UIImagePickerController {

        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
        
        return picker

    }

    
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var titleTextField: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        updateViews()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func addPhoto(_ sender: Any) {
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.present(imagePicker, animated: true)
        
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        
        if let unwrappedPhoto = photo, let title = titleTextField.text {
            photoController?.update(photo: unwrappedPhoto, image: unwrappedPhoto.imageData, title: title)
            photoImageView.image = UIImage(data: unwrappedPhoto.imageData)
            titleTextField.text = unwrappedPhoto.title
        } else {
            if let unwrappedPhoto = photo {
            photoController?.create(image: unwrappedPhoto.imageData, title: unwrappedPhoto.title)
            photoImageView.image = UIImage(data: unwrappedPhoto.imageData)
            titleTextField.text = unwrappedPhoto.title
        }
    }
        navigationController?.popViewController(animated: true)
    }
//        if let unwrappedPhoto = photo {
//            photoController?.update(photo: unwrappedPhoto, image: unwrappedPhoto.imageData, title: unwrappedPhoto.title)
//        } else {
//            if let title = photo?.title, let image = photo?.imageData {
//                photoController?.create(image: image, title: title)
//            }
//        }
        
    
    
    func setTheme() {
        if themeHelper?.themePreference == "Blue" {
            themeHelper?.setThemePreferenceToYourColorHere()
            view.backgroundColor = UIColor.blue
        } else {
            themeHelper?.setThemePreferenceToDark()
            view.backgroundColor = UIColor.darkGray
        }
    }

    func updateViews() {
        guard isViewLoaded else { return }
        
        setTheme()
        guard let image = photo?.imageData, let title = photo?.title else { return }
        photoImageView.image = UIImage(data: image)
        titleTextField.text = title
    
    
        
        
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    }
}

extension PhotoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        guard let image = info[.originalImage] as? UIImage else { return }
        photoImageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}


