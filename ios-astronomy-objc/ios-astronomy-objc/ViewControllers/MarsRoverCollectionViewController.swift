//
//  MarsRoverCollectionViewController.swift
//  ios-astronomy-objc
//
//  Created by De MicheliStefano on 09.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

import UIKit

class MarsRoverCollectionViewController: UICollectionViewController {

    // MARK: Properties
    
    let marsRoverClient = MarsRoverClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        marsRoverClient.fetchPhotos(fromRover: "curiosity", sol: 1000) { (photos, error) in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return marsRoverClient.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
    
        let photoDict = marsRoverClient.photos[indexPath.row]
        let roverImage = marsRoverClient.getImageFrom(photoDict.imageUrl)
        cell.imageView?.image = roverImage
        
        return cell
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */

}
