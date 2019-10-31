//
//  ItunesResponseSearch.swift
//  ibanez
//
//  Created by Iván Ibáñez Torres on 31/10/2019.
//  Copyright © 2019 Iván Ibáñez Torres. All rights reserved.
//

import Foundation

struct ItunesResponseSearchDTO : Codable {
    let resultCount : Int?
    let results : [SongDTO]?
}
