//
//  SearchViewController.swift
//  hciProject
//
//  Created by 준킴 on 2017. 12. 12..
//  Copyright © 2017년 junebuug. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    var list : [Video] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchController.searchResultsUpdater = self as! UISearchResultsUpdating
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.placeholder = "동영상 제목으로 검색해보세요. Search workout videos by name"
        searchController.searchBar.setValue("취소 Cancel", forKey:"_cancelButtonText")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        
        if searchText == "" {
            list = []
        }else{
            list.append(Video(id: "P8CDv4dgHEM", videoName: "전신운동 춤 갓 조쉬 앤 바믜", videoEng: "Dance good for losing weight"))
            list.append(Video(id: "llwXGZlgdU0", videoName: "레베카 루이즈 운동", videoEng: "Rebeca Louis Workout"))
            list.append(Video(id: "XTH5saFBDqA", videoName: "다리운동", videoEng: "Leg Workout"))
            list.append(Video(id: "1KGU6iB5MVE", videoName: "다이어트 자극 영상", videoEng: "Do workout"))
            list.append(Video(id: "wc_PizWNp6k", videoName: "비욘세 Move Your body", videoEng: "Beyonce : Move Your body"))
        }
        
        tableView.reloadData()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SearchViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = list[indexPath.row].videoName + " " + list[indexPath.row].videoEng
        return cell
    }
    
}


extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
