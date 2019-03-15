//
//  Strings.swift
//  SolidProject
//
//  Created by Тимур Бадретдинов on 24/02/2019.
//  Copyright © 2019 Ильдар Залялов. All rights reserved.
//

import Foundation

/// вспомогательный класс строк
class Strings {
    
    //MARK: - errors
    /// сообщение, в случае пустых полей
    let error_field_empty = "Поля не должны быть пустыми"
    /// сообщение, в случае пустых полей
    let error_passwords_not_equal = "Пароли должны совпадать"
    /// сообщение, в случае не наличия пользователя в бд по логину
    let error_no_users = "Пользователя с таким логином не существует"
    /// сообщение, в случае неправильно введенного пароля
    let error_wrong_pass = "Пароль введен неверно"
    
    // MARK: - alert
    let alert_ok = "Ok"
    let alert_title = ""
    
    // MARK: - цвета
    let color_title = "color"
    let color_white = "white"
    let color_black = "black"
}
