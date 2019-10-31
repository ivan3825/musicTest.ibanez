//
//  MainViewController.swift
//  ibanez
//
//  Created by Iván Ibáñez Torres on 31/10/2019.
//  Copyright © 2019 Iván Ibáñez Torres. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var resultSearchTable: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    private let itunesSearchPresenter = ItunesSearchPresenter(itunesSearchService: ItunesService())
        
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigationBar()
        setupTable()
        itunesSearchPresenter.setViewDelegate(itunesSearchViewDelegate: self)
    }
    
    func setupNavigationBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Music"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.searchTextField.delegate = self
    }
    
    func setupTable() {
        resultSearchTable.delegate = self
        resultSearchTable.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "musicDetailSegue",
        let indexPath = resultSearchTable.indexPathForSelectedRow,
        let detailVC = (segue.destination as? DetailViewController)
            else { return }
        
        let songSelected = songs[indexPath.row]
        detailVC.setData(song: songSelected, completeList: songs)
    }
}

extension MainViewController : ItunesSearchViewDelegate {
    func displayResultSongSearch(songs: [Song]) {
        self.songs = songs
        self.resultSearchTable.reloadData()
    }
}

extension MainViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        if(!textField.text!.isEmpty) {
            itunesSearchPresenter.searchSongSelected(title: textField.text!)
        }
        textField.resignFirstResponder()
        return true
    }
}

extension MainViewController: UISearchResultsUpdating {
      func updateSearchResults(for searchController: UISearchController) {
        // TODO
        //print(searchController.searchBar.text)
    }
}

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (resultSearchTable.dequeueReusableCell(withIdentifier: "musicCell") as! MusicTableViewCell)
        //cell.setData(image: "icon-4399630_960_720", title: "Se fue por la ventana", artist: "Paco Perez")
        let currentSong = songs[indexPath.row]
        cell.setData(imageURL: currentSong.urlImage60!, title: currentSong.title!, artist: currentSong.artist!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (resultSearchTable.dequeueReusableCell(withIdentifier: "musicCell")?.frame.height)!
    }
}
