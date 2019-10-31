//
//  MusicTableViewCell.swift
//  ibanez
//
//  Created by Iván Ibáñez Torres on 31/10/2019.
//  Copyright © 2019 Iván Ibáñez Torres. All rights reserved.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var artistName: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setData( imageURL : String, title : String, artist : String ) {
        let previewImage : UIImage
        do {
            previewImage = try UIImage(data: Data(contentsOf: URL(string: imageURL)!))!
        } catch let error {
            print(error)
            previewImage = UIImage()
        }
        self.thumbnail.image = previewImage
        self.title.text = title
        self.artistName.text = artist
    }

}
