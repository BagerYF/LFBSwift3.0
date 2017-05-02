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
        setWipeBack()
    }
    
    func setWipeBack() {
        self.navigationController?.interactivePopGestureRecognizer!.delegate = self
        self.navigationController?.navigationBar.barTintColor = UIColor.orange
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
        self.navigationController?.navigationBar.isTranslucent = false;
        self.navigationController?.navigationBar.barTintColor = UIColor.red
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.view.backgroundColor = UIColor.white
        self.title = "登录";
        telTextfield = UITextField(frame: CGRect(x: kScreenWidth - 115, y: 0, width: 100, height: 44))

        telTextfield!.backgroundColor = .white
        telTextfield?.placeholder = "请输入用户名"
        telTextfield?.textAlignment = .right
        telTextfield?.font = UIFont.systemFont(ofSize: 14)
        telTextfield?.keyboardType = .numberPad
        pwdTextfield = UITextField(frame: CGRect(x: kScreenWidth - 115, y: 0, width: 100, height: 44))
            pwdTextfield!.backgroundColor = UIColor.hex(hex: "#FFFFFF")
        pwdTextfield?.placeholder = "请输入密码"
        pwdTextfield?.textAlignment = .right
        pwdTextfield?.font = UIFont.systemFont(ofSize: 14)
        pwdTextfield?.isSecureTextEntry = true
        forgetBtn = UIButton(frame: CGRect(x: kScreenWidth - 95, y: 0, width: 80, height: 44))
        forgetBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        forgetBtn?.setTitle("忘记密码", for: .normal)
        forgetBtn?.contentHorizontalAlignment = .right
        forgetBtn?.setTitleColor(UIColor.black, for: .normal)
    }
    
    func createTable() {
        let table = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: UITableViewStyle.plain)
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.white
        
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
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let subBack = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth - 30, height: 50))
        let submitBtn = UIButton(frame: CGRect(x: 15, y: 0, width: kScreenWidth - 30, height: 50))
        subBack.addSubview(submitBtn)
        submitBtn.setTitle("登  录", for: .normal)
        submitBtn.layer.cornerRadius = 8
        submitBtn.backgroundColor = UIColor.orange
        submitBtn.setTitleColor(UIColor.white, for: .normal)
        submitBtn.addTarget(self, action: #selector(goIntoHomePage(sender:)), for: .touchUpInside)
        return subBack
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func goIntoHomePage(sender : UIButton) {
        self.view.endEditing(true)
        print("哈哈")
//        if (checkNil()) {
//            let homePageVC = HomePageVC()
//            self.navigationController?.pushViewController(homePageVC, animated: true)
//        } else {
//            let alert = UIAlertController(title: "提示", message: "用户名或密码为空", preferredStyle: .Alert)
//            let cancle = UIAlertAction(title: "cancel", style: .Cancel, handler: nil)
//            let ok = UIAlertAction(title: "ok", style: .Default, handler: { (check) -> Void in
//                print("呵呵")
//            })
//            alert.addAction(cancle)
//            alert.addAction(ok)
//            self.presentViewController(alert, animated: true, completion: nil)
//        }
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
