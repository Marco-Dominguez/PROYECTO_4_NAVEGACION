//
//  error_en_campo_ui.swift
//  PROYECTO_4_NAVIGATION
//
//  Created by Marco Dominguez on 11/03/26.
//
enum NivelesDeError{
    case gravitsimo
    case nah_solo_advierte
    case ninguno
}

struct ErrorUI{
    let campo: String
    let error: String
    let nivel_de_error: NivelesDeError
}
