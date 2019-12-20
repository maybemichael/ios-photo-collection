//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Michael on 12/19/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func create(image: Data, title: String) {
        let photo = Photo(imageData: image, title: title)

        photos.append(photo)
        print(photos)
    }
    
    func update(photo: Photo, image: Data, title: String) {
        guard let updatedPhoto = photos.firstIndex(of: photo) else { return }
        var editedPhoto = photo
        
        editedPhoto.title = title
        editedPhoto.imageData = image
        
        photos.remove(at: updatedPhoto)
        photos.insert(editedPhoto, at: updatedPhoto)
    }

}
