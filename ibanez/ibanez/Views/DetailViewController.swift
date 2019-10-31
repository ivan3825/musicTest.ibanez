//
//  DetailViewController.swift
//  ibanez
//
//  Created by Iván Ibáñez Torres on 31/10/2019.
//  Copyright © 2019 Iván Ibáñez Torres. All rights reserved.
//

import UIKit
import AVFoundation


class DetailViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleSong: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
    var song : Song?
    var completeListSongs : [Song]?
    var indexCurrentSong : Int?
    var audioManager = (UIApplication.shared.delegate as! AppDelegate).sharedAudioManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let previewImage : UIImage
        do {
            previewImage = try UIImage(data: Data(contentsOf: URL(string: song!.urlImage100!)!))!
        } catch let error {
            print(error)
            previewImage = UIImage()
        }
        self.image.image = previewImage
        self.titleSong.text = song?.title
        self.artistName.text = song?.artist
    }
    
    func setData( song : Song, completeList : [Song] ) {
        self.completeListSongs = completeList
        self.indexCurrentSong = completeList.firstIndex(where: { $0.previewUrl == song.previewUrl } )
        self.song = song
    }
    
    @IBAction func playAction(_ sender: Any) {
        audioManager.playAudio(audioUrl: song!.previewUrl!)
    }
    
    @IBAction func prevSongAction(_ sender: Any) {
        if( indexCurrentSong! > 0 ) {
            let prevSong = completeListSongs![indexCurrentSong! - 1]
            setData(song: prevSong, completeList: completeListSongs!)
            viewDidLoad()
        }
    }
    
    @IBAction func nextSongAction(_ sender: Any) {
        if( indexCurrentSong! + 1 < completeListSongs!.count ) {
            let nextSong = completeListSongs![indexCurrentSong! + 1]
            setData(song: nextSong, completeList: completeListSongs!)
            viewDidLoad()
        }
    }
}
