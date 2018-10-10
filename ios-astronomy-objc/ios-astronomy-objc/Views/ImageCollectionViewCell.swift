//
//  ImageCollectionViewCell.swift
//  ios-astronomy-objc
//
//  Created by De MicheliStefano on 09.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    override func prepareForReuse() {
        imageView.image = #imageLiteral(resourceName: "MarsPlaceholder")
        
        super.prepareForReuse()
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
}
