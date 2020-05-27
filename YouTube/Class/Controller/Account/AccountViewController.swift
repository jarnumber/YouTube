//
//  AccountViewController.swift
//  YouTube
//
//  Created by Turbo on 2020/5/19.
//  Copyright © 2020 turbo. All rights reserved.
//

import UIKit

private let cellReuseIdentifier1 = "AccountCell"
private let cellReuseIdentifier2 = "AccountVedioInfoCell"

class AccountViewController: BaseViewController {
    
    let menuTitles = ["History", "My Videos", "Notifications", "Watch Later"]
    let vedioImages = ["pl-node", "pl-react", "pl-angular", "pl-mongo", "pl-rest", "pl-javascript", "pl-swift"]
    let vedioTitles = ["NodeJS Tutorails", "React development", "Angular 2 Tutorails", "Mongo db", "Rest API Tutorails(Node & Mongo)", "Java Script ES6", "Swift Tutorails"]
    
    var tableview : UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        setupTableView()
    }
    
    private func setupTableView(){
        tableview = UITableView(frame: view.bounds, style: UITableView.Style.grouped)
        tableview?.delegate = self
        tableview?.dataSource = self
        tableview?.register(AccountCell.self, forCellReuseIdentifier: cellReuseIdentifier1)
        tableview?.register(AccountVedioInfoCell.self, forCellReuseIdentifier: cellReuseIdentifier2)
        tableview?.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableview?.sectionHeaderHeight = 0
        tableview?.sectionFooterHeight = 0
        view.addSubview(tableview!)
        tableview?.tableHeaderView = AccountHeaderView(frame: CGRect(x: 0, y: 0, width: MainScreenWidth, height: 120))
    }
    
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier1, for:indexPath) as! AccountCell
            cell.leftImageView.image = UIImage(named: menuTitles[indexPath.row])
            cell.titleLabel.text = menuTitles[indexPath.row]
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier2, for:indexPath) as! AccountVedioInfoCell
            cell.leftImageView.image = UIImage(named: vedioImages[indexPath.row])
            cell.titleLabel.text = vedioTitles[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return menuTitles.count
        }
        return vedioTitles.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return 50
        }
        return 80
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 1) {
            return 10
        }
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detail = VedioDetailController()
//        detail.vedioId = "126"
//        self.navigationController?.pushViewController(detail, animated: true)
    }
}
