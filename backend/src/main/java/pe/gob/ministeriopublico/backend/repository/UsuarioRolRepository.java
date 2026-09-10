package pe.gob.ministeriopublico.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pe.gob.ministeriopublico.backend.entity.UsuarioRol;

/** Acceso CRUD a la relación usuario-rol. */
@Repository
public interface UsuarioRolRepository extends JpaRepository<UsuarioRol, Integer> { }
