//
//  ArticleTableViewController.swift
//  NewsApp
//
//  Created by Ирина Жогова on 04.07.2018.
//  Copyright © 2018 Irina Zhogova. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleTableViewController: UITableViewController {
    
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getArticles()
        
        tableView.separatorStyle = .none
    }
    
    func getArticles () {
        
        NewsHelper().getArticles { (articles) in
            self.articles = articles
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleCell {
            
            let article = articles[indexPath.row]
            
            cell.titleLabel.text = article.title
            cell.categoryLabel.text = article.category.rawValue
            cell.categoryLabel.backgroundColor = article.categoryColor
            
            let url = URL(string: article.urlToImage)
            cell.articleImage.kf.setImage(with: url, placeholder: UIImage(named: "text-lines"), options: nil, progressBlock: nil, completionHandler: nil)
            
           return cell
        }


        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        performSegue(withIdentifier: "goToURL", sender: article)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToURL" {
            if let article = sender as? Article {
                if let webWC = segue.destination as? ArticleWebViewController {
                    webWC.article = article
                }
            }
        }
    }

    @IBAction func reloadTapped(_ sender: UIBarButtonItem) {
        getArticles()
    }
}

class ArticleCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
}















