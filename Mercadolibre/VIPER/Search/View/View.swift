//
//  ViewController.swift
//  Mercadolibre
//
//  Created by Asesoftware on 8/05/22.
//

import UIKit

class ViewController: UIViewController,PresenterToViewMLProtocol {

    @IBOutlet weak var tableForItems: UITableView!
    
    @IBOutlet weak var btnSearch: UIButton!
    
    @IBOutlet weak var txtSearch: UITextField!
    
    var dataForTable: [DataItemsModel]?
    var MercadoLPresenter:ViewToPresentMLProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "ItemsTableViewCell", bundle: nil)
        self.tableForItems.register(nib, forCellReuseIdentifier: "cell")
        self.tableForItems.delegate = self
        self.tableForItems.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        MercadoLPresenter?.startFetchingML(itemSearchV: "Motorola")
    }

    
    func dataSuccessML(dataSuccessP: [DataItemsModel]) {
        self.dataForTable = dataSuccessP
        self.tableForItems.reloadData()
    }
    
    func dataErrorML() {
        
    }

    @IBAction func goSearch(_ sender: UIButton) {
        view.endEditing(true)
        self.dataForTable = []
        self.tableForItems.reloadData()
        MercadoLPresenter?.startFetchingML(itemSearchV: self.txtSearch.text!)
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataForTable?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ItemsTableViewCell
        cell.lbItemTable.text = dataForTable?[indexPath.row].title
        
        //cell.lbImageTable.image=UIImage(data: data! as Data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailController = (storyboard.instantiateViewController(withIdentifier: "detailViewController") as? DetailViewController)!
        detailController.urlDetailItem = (dataForTable?[indexPath.row].permalink)!
        present(detailController, animated: true)
    }
    
}


