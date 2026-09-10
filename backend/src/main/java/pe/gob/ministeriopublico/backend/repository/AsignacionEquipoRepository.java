package pe.gob.ministeriopublico.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pe.gob.ministeriopublico.backend.entity.AsignacionEquipo;

/** Acceso CRUD a las asignaciones de equipo. */
@Repository
public interface AsignacionEquipoRepository extends JpaRepository<AsignacionEquipo, Integer> { }
