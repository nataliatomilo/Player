//
//  ImageCollectionViewCell.swift
//  testPlayer
//
//  Created by Наталья Томило on 4.09.22.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    var data: Songs? {
        didSet {
            guard let data = data else {
                return
            }
            imageView.image = UIImage(named: data.imageName)
        }
    }
    
    static let reuseID = "ImageCollectionViewCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    let blur: UIVisualEffectView = {
        let visiolEffectView = UIVisualEffectView()
        visiolEffectView.layer.cornerRadius = 10
        visiolEffectView.clipsToBounds = true
        visiolEffectView.translatesAutoresizingMaskIntoConstraints = false
        return visiolEffectView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
