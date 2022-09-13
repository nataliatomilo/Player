//
//  Playlist.swift
//  testPlayer
//
//  Created by Наталья Томило on 6.09.22.
//

import Foundation
import UIKit

class DataStorage {
    
    static let shared = DataStorage()
    
    let data = [Songs(name: "Trek Name 1",
                      albumName: "Album Name 1",
                      artistName: "Mot",
                      imageName: "mot",
                      trackName: "Avgust"),
                Songs(name: "Trek Name 2",
                      albumName: "Album Name 2",
                      artistName: "Dabro",
                      imageName: "dabro" ,
                      trackName: "Nol"),
                Songs(name: "Trek Name 3",
                      albumName: "Album Name 3",
                      artistName: "Joni",
                      imageName: "joni",
                      trackName: "Kommeta")]
}
