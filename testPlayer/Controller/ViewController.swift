//
//  ViewController.swift
//  testPlayer
//
//  Created by Наталья Томило on 2.09.22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let vc = View()
    var player: AVPlayer!
    public var position: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "#1D1726")
        
        addSubViews()
        setupConstraints()
        addTarget()
        play()
        
        vc.collectionView.delegate = self
        vc.collectionView.dataSource = self
    }
    
    func play() {
        let s = DataStorage.shared.data[position]
        vc.nameSongLabel.text = s.name
        vc.nameSongLabeltwo.text = s.artistName
        let playerString = Bundle.main.path(forResource: s.trackName, ofType: "mp3")
        player = AVPlayer(url: URL(fileURLWithPath: playerString!))
        vc.sliderForPlayer.maximumValue = Float(player.currentItem?.asset.duration.seconds ?? 0)
        
        player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.1, preferredTimescale: 1000), queue: DispatchQueue.main, using: {
            (time) in
            self.vc.timeLabel.text = self.timeString(time: time.seconds)
            let duration = self.player?.currentItem?.duration.seconds
            self.vc.timeLabelTwo.text = self.timeString(time: duration ?? 0.0)
            self.vc.sliderForPlayer.value = Float(time.seconds)
            
        })
        vc.nameSongLabel.font = UIFont(name: "Montserrat-Medium", size: 20)
        vc.nameSongLabel.textColor = .white
        vc.nameSongLabeltwo.font = UIFont(name: "Montserrat-Medium", size: 14)
        vc.nameSongLabeltwo.textColor = .white
        vc.timeLabel.textColor = .white
        vc.timeLabelTwo.textColor = .white
    }
    
    func addSubViews() {
        view.addSubview(vc.collectionView)
        view.addSubview(vc.nameSongLabel)
        view.addSubview(vc.nameSongLabeltwo)
        view.addSubview(vc.sliderForPlayer)
        view.addSubview(vc.timeLabel)
        view.addSubview(vc.timeLabelTwo)
        view.addSubview(vc.playButton)
        view.addSubview(vc.leftButton)
        view.addSubview(vc.rightButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            vc.collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 101),
            vc.collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vc.collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            vc.collectionView.heightAnchor.constraint(equalToConstant: 309),
            vc.nameSongLabel.topAnchor.constraint(equalTo: vc.collectionView.bottomAnchor, constant: 72),
            vc.nameSongLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            vc.nameSongLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            vc.nameSongLabeltwo.topAnchor.constraint(equalTo: vc.nameSongLabel.bottomAnchor, constant: 7),
            vc.nameSongLabeltwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            vc.nameSongLabeltwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            vc.sliderForPlayer.topAnchor.constraint(equalTo: vc.nameSongLabel.bottomAnchor, constant: 30),
            vc.sliderForPlayer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            vc.sliderForPlayer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            vc.timeLabel.topAnchor.constraint(equalTo: vc.sliderForPlayer.bottomAnchor, constant: 8),
            vc.timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            vc.timeLabelTwo.topAnchor.constraint(equalTo: vc.sliderForPlayer.bottomAnchor, constant: 8),
            vc.timeLabelTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            vc.playButton.topAnchor.constraint(equalTo: vc.sliderForPlayer.bottomAnchor, constant: 78),
            vc.playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vc.leftButton.topAnchor.constraint(equalTo: vc.sliderForPlayer.bottomAnchor, constant: 153),
            vc.leftButton.trailingAnchor.constraint(equalTo: vc.playButton.leadingAnchor, constant: 10),
            vc.rightButton.topAnchor.constraint(equalTo: vc.sliderForPlayer.bottomAnchor, constant: 153),
            vc.rightButton.leadingAnchor.constraint(equalTo: vc.playButton.trailingAnchor, constant: -10)
        ])
    }
    
    func addTarget() {
        vc.sliderForPlayer.addTarget(self, action: #selector(sliderValue(_:)), for: .allEvents)
        vc.playButton.addTarget(self, action: #selector(forPlay(_:)), for: .primaryActionTriggered)
        vc.leftButton.addTarget(self, action: #selector(didBackButton), for: .primaryActionTriggered)
        vc.rightButton.addTarget(self, action: #selector(didNextButton), for: .primaryActionTriggered)
    }
    
    @objc func sliderValue(_ sender: UISlider) {
        let iSliderValue = Int(sender.value)
        sender.value = Float(iSliderValue)
        print(iSliderValue)
    }
    
    @objc func forPlay(_ sender: UIButton) {
        if player.timeControlStatus == .playing {
            player.pause()
        } else {
            player.play()
        }
    }
    
    @objc func didNextButton() {
        if position < (DataStorage.shared.data.count - 1) {
            //player.pause()
            position = position + 1
            for subview in view.subviews {
                subview.removeFromSuperview()
            }
            addSubViews()
            setupConstraints()
            addTarget()
            play()
        }
    }
    
    @objc func didBackButton() {
        if position > 0 {
            position = position - 1
            for subview in view.subviews {
                subview.removeFromSuperview()
            }
            addSubViews()
            setupConstraints()
            addTarget()
            play()
        }
    }
    
    func timeString(time: TimeInterval) -> String {
        let minute = Int(time) / 60 % 60
        let second = Int(time) % 60
        
        return String(format: "%01i:%02i", minute, second)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 309, height: 309)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataStorage.shared.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.reuseID, for: indexPath) as! ImageCollectionViewCell
        cell.data = DataStorage.shared.data[indexPath.row]
        
        return cell
    }
}
