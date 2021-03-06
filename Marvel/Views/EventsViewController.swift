//
//  EventsViewController.swift
//  Marvel
//
//  Created by Josefina Perez on 18/01/2021.
//  Copyright © 2021 Julieta Fernández Irujo. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var arrayEvents: [Event] = [] { didSet {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        table.isHidden = false
        table.reloadData()
    }}
    
    var expandedCell: IndexPath? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        getEvents()
        configureUI()
        table.register(UINib(nibName: "EventsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    func configureUI() {
        view.backgroundColor = .veryLightGray
        table.backgroundColor = .veryLightGray
        table.isHidden = true
    }
    
    func getEvents() {
        NetworkManager.shared.getEvents(completionHandler: { events, error in
            
            if let error = error{
                self.showAlert(title: "Error", msg: error.localizedDescription)
            }
            
            else {
                self.arrayEvents = events.sorted(by: { $0.startDate < $1.startDate
                })
            }
        })
    }
}

extension EventsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: EventsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EventsTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(event: arrayEvents[indexPath.section], expanded: indexPath == expandedCell)
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayEvents.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var cellsToReload: [IndexPath] = []
        
        if let expandedCell = expandedCell  { cellsToReload.append(expandedCell) }
        
        expandedCell = indexPath == expandedCell ? nil : indexPath
        
        if let expandedCell = expandedCell  { cellsToReload.append(expandedCell) }
        
        tableView.reloadRows(at: cellsToReload, with: .automatic)
    }
}


