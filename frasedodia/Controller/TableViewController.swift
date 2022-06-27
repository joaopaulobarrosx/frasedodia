//
//  TableViewController.swift
//  frasedodia
//
//  Created by Joao Barros on 13/06/22.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var mensagens: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor.black
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "reusableCell")
  
        let salve = SalvarListar()
        mensagens = salve.listar()
        
        
    }
}
    //se tiver dando problemas pra recarregar os dados, utilizar essa linha comentada e editar o viewDidLoad
    /*override func viewDidAppear(_ animated: Bool) {
        let salve = SalvarListar()
        mensagens = salve.listar()
        tableView.reloadData()
    }*/

    // MARK: - Table view data source
extension TableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mensagens.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! MessageCell

        cell.label.text = mensagens[indexPath.row]

        return cell
    }
    
}
