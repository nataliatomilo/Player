//
//  View.swift
//  testPlayer
//
//  Created by Наталья Томило on 5.09.22.
//

import Foundation
import UIKit

class View: UIView {
    
    var collectionView: UICollectionView = {
        let layuot = UICollectionViewFlowLayout()
        layuot.scrollDirection = .horizontal
        layuot.minimumLineSpacing = 52
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layuot)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.reuseID)
        cv.backgroundColor = UIColor.clear.withAlphaComponent(0)
        cv.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true
        return cv
    }()
    
    let nameSongLabel: UILabel! = {
        let nameSongLabel = UILabel()
        nameSongLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return nameSongLabel
    }()
    
    let nameSongLabeltwo: UILabel! = {
        let nameSongLabel = UILabel()
        nameSongLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return nameSongLabel
    }()
    
    let sliderForPlayer: UISlider! = {
        let sliderForPlayer = UISlider()
        sliderForPlayer.translatesAutoresizingMaskIntoConstraints = false
        sliderForPlayer.tintColor = UIColor(named: "#8257E7")
        sliderForPlayer.setThumbImage(UIImage(named: "Ellipses"), for: UIControl.State.normal)
        
        return sliderForPlayer
    }()
    
    let timeLabel: UILabel! = {
        let timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return timeLabel
    }()
    
    let timeLabelTwo: UILabel! = {
        let timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return timeLabel
    }()
    
    let playButton: UIButton! = {
        let playButton = UIButton()
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setImage(UIImage(named: "play"), for: .normal)
        
        return playButton
    }()
    
    let leftButton: UIButton! = {
        let leftButton = UIButton()
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.setImage(UIImage(named: "left"), for: .normal)
        
        return leftButton
    }()
    
    let rightButton: UIButton! = {
        let rightButton = UIButton()
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.setImage(UIImage(named: "right"), for: .normal)
        
        return rightButton
    }()
}
