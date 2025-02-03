package com.es.mongocomp.controller

import com.es.mongocomp.dto.UsuarioDTO
import com.es.mongocomp.dto.UsuarioRegistradoDTO
import com.es.mongocomp.model.Usuario
import com.es.mongocomp.service.UsuarioService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController


@RestController
@RequestMapping("/usuarios")
class UsuarioController {

    @Autowired
    private lateinit var usuarioService: UsuarioService


    @PostMapping("/registro")
    fun registrarUsuario(@RequestBody usuario: UsuarioDTO): ResponseEntity<UsuarioRegistradoDTO> {

        val usuarioInsert = Usuario(
            usuario._id,
            usuario.nombre,
            usuario.contrasenia,
            usuario.nick,
            true,
            listOf()
        )


        val usuario =  usuarioService.inserirUsuario(usuarioInsert)

        val userRegitro = UsuarioRegistradoDTO(
            usuario._id,
            usuario.nombre,
            usuario.nick,
        )

        return ResponseEntity(userRegitro, HttpStatus.CREATED)
    }

}