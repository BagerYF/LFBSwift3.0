//
//  LoginVC.swift
//  swiftdoctor
//
//  Created by Bager on 16/1/20.
//  Copyright © 2016年 Bager. All rights reserved.
//

import UIKit

class LoginVC: BaseVC,UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,UIGestureRecognizerDelegate {

    var telTextfield:UITextField?
    var pwdTextfield:UITextField?
    var forgetBtn:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        createTable()
    }
    
    //是否允许手势
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if (gestureRecognizer == self.navigationController?.interactivePopGestureRecognizer) {
            //只有三级以及以下的页面允许手势返回
            return (self.navigationController?.viewControllers.count)! > 2
        }
        return true
    }
    
    func setUp() {
        self.view.backgroundColor = UIColor.white
        self.title = "登录";
        telTextfield = UITextField(frame: CGRect(x: kScreenWidth - 115, y: 0, width: 100, height: 50))

        telTextfield!.backgroundColor = .white
        telTextfield?.placeholder = "请输入用户名"
        telTextfield?.textAlignment = .right
        telTextfield?.font = UIFont.systemFont(ofSize: 16)
        telTextfield?.keyboardType = .numberPad
        pwdTextfield = UITextField(frame: CGRect(x: kScreenWidth - 115, y: 0, width: 100, height: 50))
            pwdTextfield!.backgroundColor = UIColor.hex(hex: "#FFFFFF")
        pwdTextfield?.placeholder = "请输入密码"
        pwdTextfield?.textAlignment = .right
        pwdTextfield?.font = UIFont.systemFont(ofSize: 16)
        pwdTextfield?.isSecureTextEntry = true
        forgetBtn = UIButton(frame: CGRect(x: kScreenWidth - 95, y: 0, width: 80, height: 50))
        forgetBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        forgetBtn?.setTitle("忘记密码", for: .normal)
        forgetBtn?.contentHorizontalAlignment = .right
        forgetBtn?.setTitleColor(UIColor.black, for: .normal)
    }
    
    func createTable() {
        let table = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: UITableViewStyle.plain)
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 50
        table.backgroundColor = YFGlobalBackgroundColor
        
        let footView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        table.tableFooterView = footView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "loginCellIdentifier";
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        
        if (indexPath.row == 0)
        {
            cell.textLabel?.text = "账户名"
            cell.addSubview(telTextfield!)
        }
        else if (indexPath.row == 1)
        {
            cell.textLabel?.text = "密码"
            cell.addSubview(pwdTextfield!)
        }
        else
        {
            cell.addSubview(forgetBtn!)
            cell.separatorInset = UIEdgeInsetsMake(0, self.view.frame.size.width, 0, 0)
        }
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let subBack = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth - 30, height: 70))
        let submitBtn = UIButton(frame: CGRect(x: 0, y: 20, width: kScreenWidth, height: 50))
        subBack.addSubview(submitBtn)
        submitBtn.setTitle("登  录", for: .normal)
        submitBtn.backgroundColor = UIColor.white
        submitBtn.setTitleColor(UIColor.black, for: .normal)
        submitBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        submitBtn.addTarget(self, action: #selector(goIntoHomePage(sender:)), for: .touchUpInside)
        return subBack
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func goIntoHomePage(sender : UIButton) {
        self.view.endEditing(true)
        if (!checkNil()) {
            dismiss(animated: true, completion: nil)
        } else {
            ProgressHUDManager.showImage(image: UIImage(named: "v2_orderSuccess")!, status: "用户名或密码为空")
        }
    }
    
    func checkNil() -> Bool {
        if (telTextfield?.text != nil && telTextfield?.text != "")
        {
            return false
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
