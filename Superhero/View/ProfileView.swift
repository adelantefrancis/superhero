//
//  ProfileView.swift
//  Superhero
//
//  Created by Francis Adelante on 2/5/25.
//

import UIKit

class ProfileView: UIView {

    @IBOutlet var view: UIView!
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var mobileNumber: UIButton!
    @IBOutlet weak var email: UIButton!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var alias: UILabel!
    
    var hero: Superhero?{
        didSet {
            guard hero != nil else {
                return
            }
            profilePicture.image = UIImage(named: hero!.Alias.lowercased())
            mobileNumber.setTitle(hero!.Mobile, for: .normal)
            email.setTitle(hero!.Email, for: .normal)
            fullName.text = hero!.Fullname
            alias.text = "@\(hero!.Alias)"
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
    }
    
    func initSubviews() {
        let nib = UINib(nibName: "ProfileView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        view.frame = bounds
        addSubview(view)
    }
}
