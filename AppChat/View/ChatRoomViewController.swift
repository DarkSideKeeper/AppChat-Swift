//
//  ChatRoomViewController.swift
//  AppChat
//
//  Created by Titipan Sakunwongsalee on 3/5/2564 BE.
//

import UIKit

class ChatRoomViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    let chatYouCellIdentifier = "YouChat"
    let chatMycellIdentifier = "MyChat"
    let myId = "3"
    
    var listData = [ListChatResponse.ListChat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupData()
    }
    
    func setupData() {
        let mockJson = MockJsonManager.shared.getJsonInChatRoom()
        let jsonData = mockJson.data(using: .utf8)!
        let jsonDecoder = JSONDecoder()
        let responseModel = try! jsonDecoder.decode(ListChatResponse.self, from: jsonData)
        
        guard let listChat = responseModel.listChat else {
            return
        }
        
        title = listChat.first?.username
        
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
    @IBAction func sendMessage(_ sender: Any) {
        guard sendTextField.text?.count ?? 0 > 0 else {
            return
        }
        
        guard let text = sendTextField.text, var data = listData.filter({ $0.userId == myId }).first else {
            sendTextField.text = ""
            return
        }
        
        data.lastMessage = text
        listData.append(data)
        tableView.performBatchUpdates({
            tableView.insertRows(at: [IndexPath(row: listData.count - 1, section: 0)], with: .automatic)
        }, completion: { _ in
            self.sendTextField.text = ""
        })
    }
    
}

extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chat = listData[indexPath.row]
        
        if chat.userId == myId {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: chatMycellIdentifier) as? ChatingCell else {
                return UITableViewCell()
            }

            cell.messageLabel.text = chat.lastMessage
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: chatYouCellIdentifier) as? ChatingCell else {
                return UITableViewCell()
            }

            let url = URL(string: chat.userImage!)
            cell.userImageView?.kf.setImage(with: url)
            cell.usernameLabel.text = chat.username
            cell.messageLabel.text = chat.lastMessage
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
