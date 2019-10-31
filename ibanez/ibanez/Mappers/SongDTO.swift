//
//  songDTO.swift
//  ibanez
//
//  Created by Iván Ibáñez Torres on 31/10/2019.
//  Copyright © 2019 Iván Ibáñez Torres. All rights reserved.
//

import Foundation

struct SongDTO : Codable {
    let wrapperType : String?
    let kind : String?
    let artistId : Int?
    let collectionId : Int?
    let trackId : Int?
    let artistName : String?
    let collectionName : String?
    let trackName : String?
    let collectionCensoredName : String?
    let trackCensoredName : String?
    let artistViewUrl : String?
    let collectionViewUrl: String?
    let trackViewUrl: String?
    let previewUrl : String?
    let artworkUrl60 : String?
    let artworkUrl100 : String?
    let collectionPrice : Float?
    let trackPrice: Float?
    let collectionExplicitness : String?
    let trackExplicitness : String?
    let discCount : Int?
    let discNumber: Int?
    let trackCount : Int?
    let trackNumber : Int?
    let trackTimeMillis :Int?
    let country : String?
    let currency : String?
    let primaryGenreName: String?
   
    
}

