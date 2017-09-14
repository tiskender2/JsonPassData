//
//  IslemViewController.swift
//  proje
//
//  Created by MacMini on 5.09.2017.
//  Copyright © 2017 MacMini. All rights reserved.
//

import UIKit

class IslemViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var btnDk: UIButton!
    @IBOutlet weak var btnSms: UIButton!
    @IBOutlet weak var tableViewJson: UITableView!
    @IBOutlet weak var BtnGb: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bul: UIButton!
    @IBOutlet weak var tmmbtn: UIButton!
    var telisim=String()
    var turisim=String()
    var dizi: [String] = []
    var dizisim : [String] = []
  
   
    @IBAction func btnDK(_ sender: Any) {
         turisim="DK"
         dizi.removeAll()
         dizi += ["100Dk","200Dk","300Dk","500Dk","1000Dk"]
        DispatchQueue.main.async() {
            self.tableView.reloadData()
        }
         tableView.isHidden=false
        
    }
    
    @IBAction func BtnGb(_ sender: Any) {
        turisim = "GB"
        dizi.removeAll()
        dizi += ["1Gb","2Gb","3Gb","5Gb","8Gb"]
           DispatchQueue.main.async() {
        self.tableView.reloadData()
        }
        tableView.isHidden=false

    }
   
        @IBAction func btnSms(_ sender: Any) {
         turisim = "SMS"
         dizi.removeAll()
         dizi += ["100Sms","200Sms","300Sms","500Sms","1000Sms"]
            DispatchQueue.main.async() {
                self.tableView.reloadData()
            }
         
         tableView.isHidden=false
    
    }
    @IBAction func bulpress(_ sender: Any) {
        
    
  
        if (btnDk.currentTitle == "Dk" || BtnGb.currentTitle == "Gb" || btnSms.currentTitle == "Sms")
        {
            let alert = UIAlertController(title: "Uyarı", message: "Lütfen Nekadar Dk/Gb/Sms Alıcaksınız Seçin ", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            
        
                self.dizisim.removeAll()
                let urlString="http://bucayapimarket.com/json.php"
                let url=URL(string: urlString)
                let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
                    if error != nil
                    {
                        print(error!)
                    }
                    else
                    {
                        
                        do
                        {
                          
                            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSArray
                            if let jsonDizi = json
                            {
                                for i in 0..<jsonDizi.count
                                {
                                    if let basliklar = jsonDizi[i] as? NSDictionary
                                    {
                                        self.dizisim.append(basliklar["baslik"] as! String )
                                        
                       
                                        
                                    }
                                }
                            }
                            DispatchQueue.main.async() {
                                
                                
                                self.tableViewJson.reloadData()
                                self.turisim = ""
                                self.tableViewJson.isHidden=false
                                
                            }
                            
                        }
                        catch
                        {
                            print(error)
                        }
                    }
                   
               
            }
           task.resume()
        }

        }

    @IBAction func satınAl(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "Başarıyla Satın Alındı ", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text=telisim
        btnSms.layer.cornerRadius = 5
        btnDk.layer.cornerRadius = 5
        BtnGb.layer.cornerRadius = 5
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
   func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count:Int?
        
        if tableView == self.tableView {
            count = dizi.count
        }
        
        if tableView == self.tableViewJson {
            count =  dizisim.count
        }
        
        return count!
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if tableView == self.tableView {
           let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
            cell.textLabel?.text=dizi[indexPath.row]
            cell.transform = CGAffineTransform(rotationAngle: 0)
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 10, height: 10)
            cell.alpha = 0
            
            UIView.beginAnimations("rotation", context: nil)
            UIView.setAnimationDuration(0.5)
            cell.transform = CGAffineTransform(translationX: 0, y: 0)
            cell.alpha = 1
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            UIView.commitAnimations()
            
            return cell
        }
        
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "mycelljson", for: indexPath) as! JsonTableView
            cell.label2.text = dizisim[indexPath.row]
            cell.buton.setTitle("Satın Al", for: .normal)
            cell.buton.layer.cornerRadius=5
            cell.transform = CGAffineTransform(rotationAngle: 0)
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 10, height: 10)
            cell.alpha = 0
            
            UIView.beginAnimations("rotation", context: nil)
            UIView.setAnimationDuration(0.5)
            cell.transform = CGAffineTransform(translationX: 0, y: 0)
            cell.alpha = 1
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            UIView.commitAnimations()
            return cell
            
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell=tableView.cellForRow(at: indexPath)
        if self.turisim == "DK"
        {
            btnDk.setTitle(cell?.textLabel?.text, for: .normal)
        }
        else if self.turisim == "GB"
        {
            
            BtnGb.setTitle(cell!.textLabel!.text, for: .normal)
        }
        else if self.turisim == "SMS"
        {
            btnSms.setTitle(cell!.textLabel!.text, for: .normal)
        }
        
      self.tableView.isHidden=true
        
    }
    
 

  
 
}
