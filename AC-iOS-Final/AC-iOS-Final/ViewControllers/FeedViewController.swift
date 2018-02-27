//
//  FeedViewController.swift
//  AC-iOS-Final
//
//  Created by C4Q on 2/26/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit
import Kingfisher

class FeedViewController: UIViewController {

    @IBAction func logOutButton(_ sender: UIBarButtonItem) {
        AuthUserService.manager.signOut()
        present(LoginViewController.storyboardInstance(), animated: true, completion: nil)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts: [Post] = [] {
        didSet {
            self.tableView.reloadData()
            print("\(posts.count) posts loaded")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DBService.manager.getAllPosts { (onlinePosts) in
            self.posts = onlinePosts
            
        }
        
        navigationItem.title = "LomograFeed"
        tableView.allowsSelection = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        self.tableView.reloadData()
//    }
    
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
        cell.configureCell(withPost: post)
    
//        cell.postLabel.text = post.comment
//        
//        let imageURLString = post.imageURL
//        print(post.imageURL)
//        let imageURL = URL(string: imageURLString)
//        
//        cell.postImageView?.kf.indicatorType = .activity
//        cell.postImageView?.kf.setImage(with: imageURL)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
}


extension FeedViewController: UITableViewDelegate {
    
}
