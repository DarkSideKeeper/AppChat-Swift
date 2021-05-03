//
//  ListChatViewController.swift
//  AppChat
//
//  Created by Titipan Sakunwongsalee on 3/5/2564 BE.
//

import UIKit
import Kingfisher

class ListChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var listData = [ListChatResponse.ListChat]()
    
    let cellIdentifier = "ListChat"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupData()
    }
    
    func setupData() {
        let mockJson = MockJsonManager.shared.getJsonListChat()
        let jsonData = mockJson.data(using: .utf8)!
        let jsonDecoder = JSONDecoder()
        let responseModel = try! jsonDecoder.decode(ListChatResponse.self, from: jsonData)
        
        guard let listChat = responseModel.listChat else {
            return
        }
        
        for data in listChat {
            listData.append(data)
        }
        
        tableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ListChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ListChatCell else {
            return UITableViewCell()
        }
        
        let chat = listData[indexPath.row]
        let url = URL(string: chat.userImage!)
        cell.userImageView?.kf.setImage(with: url)
        cell.usernameLabel.text = chat.username
        cell.messageLabel.text = chat.lastMessage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ChatRoomViewController")
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
