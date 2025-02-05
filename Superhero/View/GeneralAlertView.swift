//
//  GeneralAlertView.swift
//  Superhero
//
//  Created by Francis Adelante on 2/5/25.
//

import UIKit
enum GeneralAlertType {
    case normal
    case confirm
    case confirmOnly
}
protocol GeneralAlertViewDelegate {
    func tappedYes(toConfirm: String?)
    func tappedNo()
}
class GeneralAlertView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var alertMessage: UILabel!
    @IBOutlet weak var containerView: UIView!
    var toConfirm: String?
    var delegate: GeneralAlertViewDelegate!
    var type: GeneralAlertType! = .normal {
        didSet{
            if type == .normal {
                yesButton.removeFromSuperview()
                noButton.setTitle("OK", for: .normal)
            } else if type == .confirmOnly {
                noButton.removeFromSuperview()
                yesButton.setTitle("Ok", for: .normal)
            }
        }
    }
    @IBAction func tappedYes() {
        delegate.tappedYes(toConfirm: toConfirm)
    }
    
    @IBAction func tappedNo() {
        delegate.tappedNo()
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
            initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    func initSubviews() {
        
        let nib = UINib(nibName: "GeneralAlertView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        view.frame = bounds
        addSubview(view)
        setUpViews()
    }
    
    func setUpViews() {
        alertTitle.pageHeader()
        alertMessage.normalLabel()
        containerView.layer.cornerRadius = 20
      
    }
}
