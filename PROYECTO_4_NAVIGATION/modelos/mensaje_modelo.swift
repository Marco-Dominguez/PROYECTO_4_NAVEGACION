//
//  mensaje.swift
//  PROYECTO_4_NAVIGATION
//
//  Created by Marco Dominguez on 02/03/26.
//
import Foundation

struct Mensaje: Identifiable{
    let id = UUID()
    let texto: String
    let id_usuario: String?
}
