package pe.gob.ministeriopublico.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pe.gob.ministeriopublico.backend.entity.EstadoEquipo;

/** Acceso CRUD a los estados de equipo. */
@Repository
public interface EstadoEquipoRepository extends JpaRepository<EstadoEquipo, Integer> { }
