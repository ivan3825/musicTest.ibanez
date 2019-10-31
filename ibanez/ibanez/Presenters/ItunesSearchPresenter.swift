//
//  ItunesSearchPresenter.swift
//  ibanez
//
//  Created by Iván Ibáñez Torres on 31/10/2019.
//  Copyright © 2019 Iván Ibáñez Torres. All rights reserved.
//

import Foundation

protocol ItunesSearchViewDelegate: NSObjectProtocol {
    func displayResultSongSearch( songs : [Song] )
}

class ItunesSearchPresenter {
    private let itunesService:ItunesService
    weak private var itunesSearchViewDelegate : ItunesSearchViewDelegate?
    
    init( itunesSearchService : ItunesService ){
        self.itunesService = itunesSearchService
    }
    
    func setViewDelegate( itunesSearchViewDelegate : ItunesSearchViewDelegate? ){
        self.itunesSearchViewDelegate = itunesSearchViewDelegate
    }
    
    func searchSongSelected(title:(String)){
        itunesService.getResultSearchWith(title: title, onResponse: { [weak self] (songs) in
            self?.itunesSearchViewDelegate?.displayResultSongSearch(songs: songs)
        })
    }
}
