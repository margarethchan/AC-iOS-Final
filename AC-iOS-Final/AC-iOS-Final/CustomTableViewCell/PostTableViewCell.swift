//
//  PostTableViewCell.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postLabel: UILabel!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: "FeedCell")
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)

        // Configure the view for the selected state
    }

    
    public func configureCell(withPost post: Post) {
        self.postLabel.text = post.comment
        self.postImageView.image = nil
        
        if let postURLString = post.imageURL, let imageURL = URL(string: postURLString) {
        }
            
    }
        
}
