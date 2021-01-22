//
//  EventsTableViewCell.swift
//  Marvel
//
//  Created by Josefina Perez on 20/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import UIKit
import Kingfisher

class EventsTableViewCell: UITableViewCell {

    @IBOutlet var lbltitle: UILabel!
    @IBOutlet var lblStart: UILabel!
    @IBOutlet var lblEnd: UILabel!
    @IBOutlet var imgEvent: UIImageView!
    @IBOutlet var imgArrow: UIImageView!
    
    @IBOutlet var table: UITableView!
    
    @IBOutlet var tableHeight: NSLayoutConstraint!
    
    var event: Event?
    var expanded: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lbltitle.configureLblTitle()
        lblStart.configureLblBody()
        lblEnd.configureLblBody()
        table.register(UINib(nibName: "ComicsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        table.register(UINib(nibName: "ComicHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "header")
        table.isScrollEnabled = false
        imgEvent.contentMode = .scaleAspectFill
    }
    
    func configureCell(event: Event, expanded: Bool ) {
        
        self.event = event
        self.expanded = expanded
        
        lbltitle.text = event.title
        
        lblStart.text = event.start
        
        lblEnd.text = event.end
        
        configureImg(Url: event.thumbnail)
        
        imgArrow.image = expanded ? UIImage(systemName: "chevron.up") : UIImage(systemName: "chevron.down")
        
        tableHeight.constant = CGFloat(expanded ? Double(event.comics.count) * ComicsTableViewCell.cellHeight : 0.0)
        
        table.reloadData()
    }
    
    func configureImg(Url: String) {
        let url = URL(string: Url)
        imgEvent.kf.setImage(with: url)
    }
    
}

extension EventsTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expanded ? (event?.comics.count ?? 0) : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: ComicsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ComicsTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(comicTitle: (event?.comics[indexPath.row]) ?? "")

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 37.0
    }

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let header = table.dequeueReusableHeaderFooterView(withIdentifier: "header") as? ComicHeader else { return nil }
        header.configure(title: "COMICS A DISCUTIR")
        return header
    }
}

