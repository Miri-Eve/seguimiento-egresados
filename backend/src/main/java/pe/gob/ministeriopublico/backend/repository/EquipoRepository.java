package pe.gob.ministeriopublico.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pe.gob.ministeriopublico.backend.entity.Equipo;

/** Acceso CRUD a los equipos. */
@Repository
public interface EquipoRepository extends JpaRepository<Equipo, Integer> { }
