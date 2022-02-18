//
//  MyCollectionViewCell.swift
//  MovieQuotes
//
//  Created by Najla on 12/01/2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var MovieName: UILabel!
    @IBOutlet weak var MovieImageView: UIImageView!
    
    static let identifier = "MyCell"
    
    public func configure(image: UIImage, name: String){
        MovieName.text = name
        MovieImageView.image = image
        MovieImageView.contentMode = .scaleAspectFill
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
