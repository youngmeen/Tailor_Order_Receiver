//
//  ViewController.swift
//  TailorOrder_Receive
//
//  Created by developer on 2021/07/05.
//

import UIKit
import Firebase
import MaterialComponents.MaterialDialogs

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    //데이터 베이스 선언
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setDB()

    }
    
    func setDB() -> Void {
        let nowDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd(E)"
        
        let converDate = dateFormatter.string(from: nowDate)
        
        print(converDate)
        ref = Database.database().reference(withPath: "orderList/\(converDate)")
        ref.observe(DataEventType.value, with: { (snapshot) in
          // ...
            print(snapshot.value as Any)
        })

    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = MDCAlertController(title: "Title string", message: "Message string")
        let action = MDCAlertAction(title:"OK") { (action) in
            print("OK")
        }
        alertController.addAction(action)
        present(alertController, animated:true, completion:nil)
    }
}


