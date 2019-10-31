//
//  ItunesService.swift
//  ibanez
//
//  Created by Iván Ibáñez Torres on 31/10/2019.
//  Copyright © 2019 Iván Ibáñez Torres. All rights reserved.
//

import Foundation
import Alamofire

class ItunesService {
    let URL_API = "https://itunes.apple.com"
    
    //MARK: ENPPOINTS
    let ENDPOINT_SEARCH = "/search?"
    
    func getResultSearchWith( title : String, onResponse : @escaping(( [Song] )->Void) ) {
        let titleWithoutSpaces = title.replacingOccurrences(of: " ", with: "+")
        let url = URL_API +  ENDPOINT_SEARCH + "term=" + titleWithoutSpaces + "&entity=song"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON(completionHandler: { (response) in
            //print(response.data)
            do {
                let responseDTO = try JSONDecoder().decode(ItunesResponseSearchDTO.self, from: response.data!)
                //print(songs)
                onResponse( self.getSongsArray(songsDTO: responseDTO.results ?? [SongDTO]() ) )
            } catch let error {
                print(error)
                onResponse([Song]())
            }
        })
    }
    
    func getSongsArray( songsDTO : [SongDTO] ) -> [Song] {
        var songs = [Song]()
        for currentSongDTO in songsDTO {
            let song = Song(title: currentSongDTO.trackName, artist: currentSongDTO.artistName, urlImage60: currentSongDTO.artworkUrl60, urlImage100: currentSongDTO.artworkUrl100, previewUrl: currentSongDTO.previewUrl)
            songs.append(song)
            print(song.title!)
        }
        return songs
    }
}

