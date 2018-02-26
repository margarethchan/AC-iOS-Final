//
//  FeedViewController.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var posts: [Post] = [] {
        didSet {
            print("\(posts.count) posts loaded")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "LomograFeed"
        tableView.allowsSelection = false
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200
        // Do any additional setup after loading the view.
    }

    
    public static func storyboardInstance() -> UINavigationController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let presentedVC = storyboard.instantiateViewController(withIdentifier: "FeedViewController") as! FeedViewController
        let navController = UINavigationController(rootViewController: presentedVC)
        return navController
    }
    
    
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! PostTableViewCell
        let post = posts[indexPath.row]
        cell.postImageView.image = post.image
        cell.postLabel.text = post.comment
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
}


extension FeedViewController: UITableViewDelegate {
    
}
