//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Michael on 12/19/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import UIKit



class PhotosCollectionViewController: UICollectionViewController {

    
    let photoController = PhotoController()
    
    let themeHelper = ThemeHelper()
    
    override func viewWillAppear(_ animated: Bool) {
        setTheme()
        collectionView.reloadData()
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//
//        collectionView.reloadData()
//        setTheme()
//        collectionView.reloadData()
//    }
    
    override func viewDidLoad() {
        
    }

    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotoDetailSegue" {
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController else { return }
            photoDetailVC.photoController = photoController
            photoDetailVC.themeHelper = themeHelper
        }
        
        if segue.identifier == "SelectThemeSegue" {
            guard let themeSelectVC = segue.destination as? ThemeSelectionViewController else { return }
            themeSelectVC.themeHelper = themeHelper
        }
        
        if segue.identifier == "PhotoCell" {
            guard let photoDeetsVC = segue.destination as? PhotoDetailViewController else { return }
            photoDeetsVC.themeHelper = themeHelper
            photoDeetsVC.photoController = photoController
            guard let indexPath = collectionView?.indexPathsForSelectedItems?.first else { return }
            photoDeetsVC.photo = photoController.photos[indexPath.item]
        }
    }
    

    // MARK: UICollectionViewDataSource

    


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell()}
    
        let photo = photoController.photos[indexPath.item]
        
         
        
        cell.photoLabel.text = photo.title
        cell.photoImageView.image = UIImage(data: photo.imageData)
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    
    

    
    func setTheme() {
        
        guard let theme = themeHelper.themePreference else { return }
        if theme == "Blue" {
            themeHelper.setThemePreferenceToYourColorHere()
            view.backgroundColor = UIColor.blue
        } else {
            themeHelper.setThemePreferenceToDark()
            view.backgroundColor = UIColor.darkGray
        }
        
//        if themeHelper.themePreference == "Blue" {
//                collectionView.backgroundColor = UIColor.blue
//            } else {
//                collectionView.backgroundColor = UIColor.darkGray
//        }
    }
}


