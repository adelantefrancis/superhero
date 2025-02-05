//
//  MainViewController.swift
//  Superhero
//
//  Created by Francis Adelante on 2/5/25.
//

import UIKit

class MainViewController: BaseViewController {
    
    lazy var viewModel: MissionViewModel = {
        return MissionViewModel()
    }()
    
    var tableView: GenericTableView<MissionTableViewCell, Mission>?
    var missions: [Mission]!
    override func viewDidLoad() {
        super.viewDidLoad()
        missions = viewModel.fetchPlistMissions(name: "Missions")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupUI()
        
    }
    
    private func setupUI() {
        title = "Missions"
        let menuItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: #selector(self.tappedMenu))
        menuItem.tintColor = UIColor.shCharcoal
        self.navigationItem.leftBarButtonItem = menuItem
        
        tableView = GenericTableView<MissionTableViewCell, Mission>()
        tableView!.items = missions ?? []
        tableView!.backgroundColor = .myBackground
        tableView!.estimatedRowHeight = 100
        tableView!.genericTableViewDelegate = self
        view.addSubview(tableView!)
        tableView?.snp.makeConstraints({ make in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
        })
        
        tableView!.reloadData()
    }
    @objc func tappedMenu() {
        drawer()?.open(to: .left)
    }
    
}

extension MainViewController: GenericTableViewDelegate{
    func didTappedRow(item: Any) {
        
    }
}
