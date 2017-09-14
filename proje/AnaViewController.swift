//
//  AnaViewController.swift
//  proje
//
//  Created by MacMini on 5.09.2017.
//  Copyright © 2017 MacMini. All rights reserved.
//

import UIKit

class AnaViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var butonLabel: UIButton!
    @IBOutlet weak var tableview: UITableView!
    var labelText=String()
    var telMarka: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      

        Label.text = "\(labelText) telefonları"
        switch (labelText) {
        case "Apple":
            telMarka += ["Iphone8","Iphone7","Iphone6","Iphone5","Iphone4","Iphone3"]; break
        case "Samsung":
            telMarka += ["S8+","S8","S7+","S7","S6","S6 edge"]; break
        case "Nokia":
            telMarka += ["3310","3300","6600","7210","N73","N72"]; break
        case "Sony":
            telMarka += ["Xperia Z","Xperia Z5","XPeria 10","XPeria 0","XPeria Z10","Xperia"]; break
        case "Huwawei":
            telMarka += ["Huwawei 9","Huwawei Made","Huwawei 8","Huwawei 1","Huwawei 5","Huwawei Made 7"]; break
        default:
           telMarka += ["S8+","S8","S7+","S7","S6","S6 edge"]; break
        }
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return telMarka.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        cell.textLabel?.text=telMarka[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell=tableView.cellForRow(at: indexPath)
        butonLabel.setTitle(cell?.textLabel?.text, for: .normal)
        self.tableview.isHidden=true
        
    }
    
   
    @IBAction func butonPressed(_ sender: Any) {
        self.tableview.isHidden = !self.tableview.isHidden

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "islemileri" {
        let telisim : IslemViewController=segue.destination as! IslemViewController
        telisim.telisim = butonLabel.currentTitle!
        }
    
    }



    
}
