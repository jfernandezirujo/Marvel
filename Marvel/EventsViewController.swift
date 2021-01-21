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
    var arrayEvents: [Event] = [] { didSet {
    table.reloadData()
        }}
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getEvents()
        configureUI()
        table.register(UINib(nibName: "EventsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    func configureUI() {
        view.backgroundColor = .veryLightGray
        table.backgroundColor = .veryLightGray
    }
    
    
    func getEvents() {
        NetworkManager.shared.getEvents(completionHandler: { events, error in
            if let error = error{
                print(error)
            }
            
            else {
                self.arrayEvents = events
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
        
        cell.configureCell(event: arrayEvents[indexPath.section])
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayEvents.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var view = UIView()
        view.backgroundColor = .clear
        
        return view
    }
    
    
}


