//
//  UITableView+.swift
//  Superhero
//
//  Created by Francis Adelante on 2/5/25.
//

import UIKit
protocol GenericTableViewDelegate {
    func didTappedRow(item:Any)
    func tableViewDidScrollToBottom()
    func didTappedDelete(item:Any)
}
extension GenericTableViewDelegate {
    func tableViewDidScrollToBottom() {
        
    }
    func didScroll(){
        
    }
    func didTappedDelete(item:Any){
        
    }
}
class GenericTableView<C: GenericCell<U>, U>:UITableView, UITableViewDataSource,UITableViewDelegate {
  
    let cellID = "cellID"
    var items = [U]()
    var genericTableViewDelegate: GenericTableViewDelegate?
    var editMode: Bool = false
    override func didAddSubview(_ subview: UIView) {
        register(C.self, forCellReuseIdentifier: cellID)
        delegate = self
        dataSource = self
        estimatedRowHeight = 60
        rowHeight = UITableView.automaticDimension
        DispatchQueue.main.async {
            self.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 1))
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! GenericCell<U>
        cell.item = items[indexPath.row]
        cell.editMode = editMode
        cell.layoutIfNeeded()
        cell.setNeedsLayout()
        cell.genericCellDelegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard editMode != true else {
            genericTableViewDelegate?.didTappedDelete(item: items[indexPath.row])
            return
        }
        guard genericTableViewDelegate != nil else {
            return
        }
        genericTableViewDelegate!.didTappedRow(item: items[indexPath.row])
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        genericTableViewDelegate?.tableViewDidScrollToBottom()
    }
}
extension GenericTableView: GenericCellDelegate{
    func deleteCell(item: Any) {
        genericTableViewDelegate?.didTappedDelete(item: item)
    }
}

protocol GenericCellDelegate{
    func deleteCell(item: Any)
}

class GenericCell<U>: UITableViewCell{
    var item: U!
    var editMode:Bool = false
    var genericCellDelegate: GenericCellDelegate!
}
