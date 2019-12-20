//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Michael on 12/19/19.
//  Copyright © 2019 Michael. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    
    
    
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var photoLabel: UILabel!
    
    
    func updateViews() {
        guard let image = photo?.imageData else { return }
        photoImageView.image = UIImage(data: image)
        
        photoLabel.text = photo?.title
    }
    
    
    
    
}
