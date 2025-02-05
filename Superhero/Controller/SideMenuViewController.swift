//
//  SideMenuViewController.swift
//  Superhero
//
//  Created by Francis Adelante on 2/5/25.
//

import UIKit
import SnapKit

class SideMenuViewController: BaseViewController {

    @IBOutlet weak var profileViewContainer: UIView!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var qoute: UILabel!
    lazy var hero: Superhero = {
        return mainViewModel.fetchHeroInSession()
    }()!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    private func setupUI() {
        let profileView = ProfileView()
        profileView.hero = hero
        qoute.text = "\(hero.Qoute) -\(hero.Alias)"
        guard profileViewContainer.subviews.count == 0 else {
            return
        }
        
        profileViewContainer.addSubview(profileView)
        profileView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        
    }
    
    @IBAction func profile() {
        showUnderConstructionAlert()
    }
    
    @IBAction func missions() {
        showUnderConstructionAlert()
    }
    
    @IBAction func tappedAchivements() {
        showUnderConstructionAlert()
    }
    
    @IBAction func tappedSettings() {
        showUnderConstructionAlert()
    }
    
    @IBAction func tappedLogout() {
        let alert = UIAlertController(title: "Log out", message: "Are you sure?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Confirm", style: .destructive, handler: { (action: UIAlertAction!) in
            self.hardLogout()
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            alert .dismiss(animated: true, completion: nil)
        }))

        present(alert, animated: true, completion: nil)
       
    }
    
}
