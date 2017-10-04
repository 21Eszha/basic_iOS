//
//  ViewController.swift
//  basic_iOS
//
//  Created by Ayrus Aszer on 10/4/17.
//  Copyright © 2017 Resza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var data = [post]()
    var postViewModel = PostViewModel()
    var selectedData = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.getData()
    }
    func getData () {
        self.postViewModel.getPost(onSuccess: { postData in
            self.data = postData
            self.tableView.reloadData()
        }) { error in
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "comments" {
            let comments = segue.destination as? CommentsViewController
            comments?.idPOST = self.data[self.selectedData].id!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let postData = data[indexPath.row]
        
        cell.title.text = postData.title
        cell.body.text = postData.body
    
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedData = indexPath.row
        self.performSegue(withIdentifier: "comments", sender: self)
    }
}
