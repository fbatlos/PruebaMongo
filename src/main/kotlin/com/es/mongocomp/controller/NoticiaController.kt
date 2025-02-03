package com.es.mongocomp.controller

import com.es.mongocomp.dto.NoticiaDTO
import com.es.mongocomp.dto.NoticiaInsertDTO
import com.es.mongocomp.model.Noticia
import com.es.mongocomp.service.NoticiaService
import jakarta.servlet.http.HttpServletRequest
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import java.util.*

@RestController
@RequestMapping("/noticias")
class NoticiaController {

    @Autowired
    private lateinit var noticiaService: NoticiaService
//Mirar modelMaping para DTO a normal

    @PostMapping("/insert")
    fun postNoticia() : String{

        val noticia = Noticia(null,"noticia insert ","holamundo", Date(), listOf(),"Morri")

        noticiaService.insertarNoticia(noticia)

        return "<h1>Hola Mundo!</h1>"
    }

    @GetMapping("/All")
    fun getNoticias() : List<Noticia>{
        return noticiaService.findAll()
    }

    @PostMapping("/")
    fun insert(
        @RequestBody noticiaDTO : NoticiaInsertDTO,
        httpRequest: HttpServletRequest)
    : ResponseEntity<NoticiaDTO> {
        //Mapeamos los campos

        val noticiaEntity = Noticia(
            _id = null,
            noticiaDTO.titulo,
            noticiaDTO.cuerpo,
            Date(),
            listOf(),
            noticiaDTO.user
        )

        val noticiaInser = noticiaService.insertarNoticia(noticiaEntity)

        val noticiaDTO = NoticiaDTO(
            noticiaInser.titulo,
            noticiaInser.cuerpo,
            noticiaInser.user,
            noticiaInser.tag,
            noticiaInser.fecha_pub,
        )

        return ResponseEntity(noticiaDTO, HttpStatus.CREATED)
    }

    @PutMapping("/{titulo}")
    fun updateNoticia(
        @PathVariable("titulo")
        titulo: String,
        @RequestBody noticia: Noticia,
        httpRequest: HttpServletRequest
    ): ResponseEntity<Noticia> {

        val noticia = noticiaService.update(noticia,titulo)

        return ResponseEntity(noticia, HttpStatus.OK)
    }

}